USE Data_Base_7
GO


INSERT INTO Users (Login, Email, PasswordHash)
VALUES
(N'player1', N'player1@mail.com', N'hash123');
GO



INSERT INTO UserProfiles
    (UserID, DisplayName, BirthDate, Country)
VALUES
(1, N'Player One', '2000-05-15', N'Finland');
GO



INSERT INTO Developers (Name, Website)
VALUES
(N'Valve', N'https://www.valvesoftware.com');
GO



INSERT INTO Publishers (Name, Website)
VALUES
(N'Valve Corporation', N'https://www.valvesoftware.com');
GO



INSERT INTO Genres (Name, Description)
VALUES
(N'Action', N'Action games');
GO



INSERT INTO Tags (Name)
VALUES
(N'Multiplayer');
GO



INSERT INTO Games
    (PublisherID, Title, Description, ReleaseDate, Price, AgeRating)
VALUES
(1,
 N'Counter-Strike 2',
 N'Multiplayer competitive shooter',
 '2023-09-27',
 0.00,
 16);
GO



INSERT INTO GameDevelopers
    (GameID, DeveloperID)
VALUES
(1, 1);
GO



INSERT INTO GameGenres
    (GameID, GenreID)
VALUES
(1, 1);
GO



INSERT INTO GameTags
    (GameID, TagID)
VALUES
(1, 1);
GO



INSERT INTO Wallets
    (UserID, Balance)
VALUES
(1, 100.00);
GO



INSERT INTO Purchases
    (UserID, GameID, Price, Status)
VALUES
(1, 1, 0.00, N'Completed');
GO



INSERT INTO Libraries
    (UserID, GameID, Source)
VALUES
(1, 1, N'Free');
GO



INSERT INTO Transactions
    (WalletID, UserID, PurchaseID, Amount, Type)
VALUES
(1, 1, NULL, 100.00, N'Purchase');
GO