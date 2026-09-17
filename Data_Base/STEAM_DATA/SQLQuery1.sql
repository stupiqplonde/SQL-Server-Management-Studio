USE Data_Base_7
go 


CREATE TABLE Users
(
    UserID int IDENTITY(1,1) PRIMARY KEY,
    Login NVARCHAR(50) NOT NULL UNIQUE,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
GO



CREATE TABLE UserProfiles
(
    UserProfileID int IDENTITY(1,1) PRIMARY KEY,
    UserID int NOT NULL UNIQUE,
    DisplayName NVARCHAR(100) NOT NULL,
    BirthDate DATE NULL,
    Country NVARCHAR(100) NULL,

    CONSTRAINT FK_UserProfiles_Users
        FOREIGN KEY (UserID)
        REFERENCES Users(UserID)
);
GO



CREATE TABLE Developers
(
    DeveloperID int IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(150) NOT NULL,
    Website NVARCHAR(255) NULL
);
GO



CREATE TABLE Publishers
(
    PublisherID int IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(150) NOT NULL,
    Website NVARCHAR(255) NULL
);
GO



CREATE TABLE Genres
(
    GenreID int IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL UNIQUE,
    Description NVARCHAR(500) NULL
);
GO



CREATE TABLE Tags
(
    TagID int IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL UNIQUE
);
GO



CREATE TABLE Games
(
    GameID int IDENTITY(1,1) PRIMARY KEY,
    PublisherID int NOT NULL,
    Title NVARCHAR(200) NOT NULL,
    Description NVARCHAR(500) NULL,
    ReleaseDate DATE NOT NULL,
    Price DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    AgeRating int NOT NULL DEFAULT 0,

    CONSTRAINT FK_Games_Publishers
        FOREIGN KEY (PublisherID)
        REFERENCES Publishers(PublisherID),

    CONSTRAINT CK_Games_Price
        CHECK (Price >= 0),

    CONSTRAINT CK_Games_AgeRating
        CHECK (AgeRating IN (0, 6, 12, 16, 18))
);
GO



CREATE TABLE GameDevelopers
(
    GameID int NOT NULL,
    DeveloperID int NOT NULL,

    CONSTRAINT PK_GameDevelopers
        PRIMARY KEY (GameID, DeveloperID),

    CONSTRAINT FK_GameDevelopers_Games
        FOREIGN KEY (GameID)
        REFERENCES Games(GameID),

    CONSTRAINT FK_GameDevelopers_Developers
        FOREIGN KEY (DeveloperID)
        REFERENCES Developers(DeveloperID)
);
GO



CREATE TABLE GameGenres
(
    GameID int NOT NULL,
    GenreID int NOT NULL,

    CONSTRAINT PK_GameGenres
        PRIMARY KEY (GameID, GenreID),

    CONSTRAINT FK_GameGenres_Games
        FOREIGN KEY (GameID)
        REFERENCES Games(GameID),

    CONSTRAINT FK_GameGenres_Genres
        FOREIGN KEY (GenreID)
        REFERENCES Genres(GenreID)
);
GO



CREATE TABLE GameTags
(
    GameID int NOT NULL,
    TagID int NOT NULL,

    CONSTRAINT PK_GameTags
        PRIMARY KEY (GameID, TagID),

    CONSTRAINT FK_GameTags_Games
        FOREIGN KEY (GameID)
        REFERENCES Games(GameID),

    CONSTRAINT FK_GameTags_Tags
        FOREIGN KEY (TagID)
        REFERENCES Tags(TagID)
);
GO



CREATE TABLE Wallets
(
    WalletID int IDENTITY(1,1) PRIMARY KEY,
    UserID int NOT NULL UNIQUE,
    Balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
    UpdatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    CONSTRAINT FK_Wallets_Users
        FOREIGN KEY (UserID)
        REFERENCES Users(UserID),

    CONSTRAINT CK_Wallets_Balance
        CHECK (Balance >= 0)
);
GO



CREATE TABLE Purchases
(
    PurchaseID INT IDENTITY(1,1) PRIMARY KEY,
    UserID int NOT NULL,
    GameID int NOT NULL,
    PurchasedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    Price DECIMAL(10,2) NOT NULL,
    Status NVARCHAR(20) NOT NULL DEFAULT N'Completed',

    CONSTRAINT FK_Purchases_Users
        FOREIGN KEY (UserID)
        REFERENCES Users(UserID),

    CONSTRAINT FK_Purchases_Games
        FOREIGN KEY (GameID)
        REFERENCES Games(GameID),

    CONSTRAINT CK_Purchases_Price
        CHECK (Price >= 0),

    CONSTRAINT CK_Purchases_Status
        CHECK (Status IN
        (
            N'Completed',
            N'Pending',
            N'Refunded',
            N'Cancelled'
        ))
);
GO

CREATE TABLE Libraries
(
    LibraryID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    GameID INT NOT NULL,
    AddedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    Source NVARCHAR(30) NOT NULL DEFAULT N'Purchase',

    CONSTRAINT FK_Libraries_Users
        FOREIGN KEY (UserID)
        REFERENCES Users(UserID),

    CONSTRAINT FK_Libraries_Games
        FOREIGN KEY (GameID)
        REFERENCES Games(GameID),

    CONSTRAINT UQ_Libraries_User_Game
        UNIQUE (UserID, GameID),

    CONSTRAINT CK_Libraries_Source
        CHECK (Source IN
        (
            N'Purchase',
            N'Gift',
            N'Free',
            N'Key'
        ))
);
GO

CREATE TABLE Transactions
(
    TransactionID INT IDENTITY(1,1) PRIMARY KEY,
    WalletID INT NOT NULL,
    UserID INT NOT NULL,
    PurchaseID INT NULL,
    Amount DECIMAL(12,2) NOT NULL,
    Type NVARCHAR(30) NOT NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    CONSTRAINT FK_Transactions_Wallets
        FOREIGN KEY (WalletID)
        REFERENCES Wallets(WalletID),

    CONSTRAINT FK_Transactions_Users
        FOREIGN KEY (UserID)
        REFERENCES Users(UserID),

    CONSTRAINT FK_Transactions_Purchases
        FOREIGN KEY (PurchaseID)
        REFERENCES Purchases(PurchaseID),

    CONSTRAINT CK_Transactions_Amount
        CHECK (Amount <> 0),

    CONSTRAINT CK_Transactions_Type
        CHECK (Type IN
        (
            N'Deposit',
            N'Purchase',
            N'Refund',
            N'Withdrawal'
        ))
);
go



INSERT INTO Users (Login, Email, PasswordHash)
VALUES
(N'player1', N'player1@mail.com', N'hash123');
go



INSERT INTO UserProfiles
    (UserID, DisplayName, BirthDate, Country)
VALUES
(1, N'Player One', '2000-05-15', N'Finland');
go



INSERT INTO Developers (Name, Website)
VALUES
(N'Valve', N'https://www.valvesoftware.com');
go



INSERT INTO Publishers (Name, Website)
VALUES
(N'Valve Corporation', N'https://www.valvesoftware.com');
go



INSERT INTO Genres (Name, Description)
VALUES
(N'Action', N'Action games');
go



INSERT INTO Tags (Name)
VALUES
(N'Multiplayer');
go



INSERT INTO Games
    (PublisherID, Title, Description, ReleaseDate, Price, AgeRating)
VALUES
(1,
 N'Counter-Strike 2',
 N'Multiplayer competitive shooter',
 '2023-09-27',
 0.00,
 16);
go



INSERT INTO GameDevelopers
    (GameID, DeveloperID)
VALUES
(1, 1);
go



INSERT INTO GameGenres
    (GameID, GenreID)
VALUES
(1, 1);
go



INSERT INTO GameTags
    (GameID, TagID)
VALUES
(1, 1);
go



INSERT INTO Wallets
    (UserID, Balance)
VALUES
(1, 100.00);
go



INSERT INTO Purchases
    (UserID, GameID, Price, Status)
VALUES
(1, 1, 0.00, N'Completed');
go



INSERT INTO Libraries
    (UserID, GameID, Source)
VALUES
(1, 1, N'Free');
go



INSERT INTO Transactions
    (WalletID, UserID, PurchaseID, Amount, Type)
VALUES
(1, 1, NULL, 100.00, N'Purchase');
go

SELECT * FROM UserProfiles, Users, Publishers, Purchases, GameDevelopers, GameGenres, Games, GameTags

