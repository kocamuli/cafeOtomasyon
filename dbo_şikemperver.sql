USE [dbo_şikemperver]
GO
/****** Object:  Table [dbo].[Tbl_Adisyon]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Adisyon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SERVISTURNO] [int] NULL,
	[PERSONELID] [int] NULL,
	[MASAID] [int] NULL,
	[TARIH] [datetime] NULL,
	[DURUM] [bit] NULL,
 CONSTRAINT [PK_Tbl_Adisyon] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DenemeSorgu]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DenemeSorgu]
AS
SELECT ID, SERVISTURNO, PERSONELID, MASAID, TARIH, DURUM
FROM     dbo.Tbl_Adisyon
GO
/****** Object:  Table [dbo].[Tbl_Satıslar]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Satıslar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ADISYONID] [int] NULL,
	[URUNID] [int] NULL,
	[MASAID] [int] NULL,
	[ADET] [int] NULL,
	[DURUM] [bit] NULL,
 CONSTRAINT [PK_Tbl_Satıslar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Kategoriler]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Kategoriler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KATEGORIADI] [nvarchar](100) NULL,
	[ACIKLAMA] [text] NULL,
	[DURUM] [bit] NULL,
 CONSTRAINT [PK_Tbl_Kategoriler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Urunler]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Urunler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KATEGORIID] [int] NULL,
	[URUNAD] [nvarchar](100) NULL,
	[ACIKLAMA] [text] NULL,
	[FIYAT] [money] NULL,
	[DURUM] [bit] NULL,
 CONSTRAINT [PK_Tbl_Urunler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[view_kategoriler_Satısler_urunler]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_kategoriler_Satısler_urunler]
AS
SELECT dbo.Tbl_Kategoriler.ID, dbo.Tbl_Kategoriler.KATEGORIADI, dbo.Tbl_Satıslar.ID AS Expr1, dbo.Tbl_Satıslar.URUNID, dbo.Tbl_Satıslar.MASAID, dbo.Tbl_Urunler.KATEGORIID, dbo.Tbl_Urunler.URUNAD, dbo.Tbl_Urunler.ID AS Expr2, 
                  dbo.Tbl_Satıslar.ADISYONID
FROM     dbo.Tbl_Kategoriler INNER JOIN
                  dbo.Tbl_Satıslar ON dbo.Tbl_Kategoriler.ID = dbo.Tbl_Satıslar.ID INNER JOIN
                  dbo.Tbl_Urunler ON dbo.Tbl_Kategoriler.ID = dbo.Tbl_Urunler.KATEGORIID AND dbo.Tbl_Satıslar.URUNID = dbo.Tbl_Urunler.ID
GO
/****** Object:  Table [dbo].[Tbl_Personeller]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Personeller](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GOREVID] [int] NULL,
	[AD] [nvarchar](50) NULL,
	[SOYAD] [nvarchar](50) NULL,
	[PAROLA] [nvarchar](50) NULL,
	[KULLANICIADI] [nvarchar](50) NULL,
	[DURUM] [bit] NULL,
 CONSTRAINT [PK_Tbl_Personeller] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_PersonelGorev]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_PersonelGorev](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GOREV] [nvarchar](50) NULL,
	[ACIKLAMA] [text] NULL,
	[DURUM] [bit] NULL,
 CONSTRAINT [PK_Tbl_PersonelGorev] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_PersonelHareketleri]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_PersonelHareketleri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PERSONELID] [int] NULL,
	[ISLEM] [nvarchar](50) NULL,
	[TARIH] [datetime] NULL,
	[DURUM] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[personel_view]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[personel_view]
AS
SELECT dbo.Tbl_PersonelGorev.ID, dbo.Tbl_Personeller.GOREVID, dbo.Tbl_PersonelHareketleri.PERSONELID, dbo.Tbl_PersonelGorev.GOREV, dbo.Tbl_PersonelHareketleri.ISLEM, dbo.Tbl_Personeller.AD, dbo.Tbl_Personeller.SOYAD
FROM     dbo.Tbl_PersonelGorev INNER JOIN
                  dbo.Tbl_PersonelHareketleri ON dbo.Tbl_PersonelGorev.ID = dbo.Tbl_PersonelHareketleri.ID INNER JOIN
                  dbo.Tbl_Personeller ON dbo.Tbl_PersonelGorev.ID = dbo.Tbl_Personeller.GOREVID
GO
/****** Object:  View [dbo].[view_urunler]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[view_urunler]
AS
SELECT dbo.Tbl_Kategoriler.ID, dbo.Tbl_Kategoriler.KATEGORIADI, dbo.Tbl_Urunler.URUNAD, dbo.Tbl_Urunler.KATEGORIID, dbo.Tbl_Urunler.FIYAT
FROM     dbo.Tbl_Kategoriler INNER JOIN
                  dbo.Tbl_Urunler ON dbo.Tbl_Kategoriler.ID = dbo.Tbl_Urunler.KATEGORIID
GO
/****** Object:  Table [dbo].[Tbl_HesapOdemeleri]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_HesapOdemeleri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MUSTERIID] [int] NULL,
	[ADISYONID] [int] NULL,
	[ODEMETURUID] [int] NULL,
	[ARATOPLAM] [money] NULL,
	[KDVTUTARI] [money] NULL,
	[INDIRIM] [money] NULL,
	[TOPLAMTUTAR] [money] NULL,
	[TARIH] [datetime] NULL,
	[DURUM] [bit] NULL,
 CONSTRAINT [PK_Tbl_HesapOdemeleri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Masalar]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Masalar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KAPASITE] [int] NULL,
	[SERVISTURU] [int] NULL,
	[DURUM] [int] NULL,
	[ONAY] [bit] NULL,
 CONSTRAINT [PK_Tbl_Masalar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Musteriler]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Musteriler](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AD] [nvarchar](50) NULL,
	[SOYAD] [nvarchar](50) NULL,
	[ADRES] [text] NULL,
	[TELEFON] [nvarchar](50) NULL,
	[ILKSIPARIS] [nvarchar](50) NULL,
	[EMAİL] [nvarchar](50) NULL,
	[SIPARISSAYISI] [int] NULL,
	[DURUM] [bit] NULL,
 CONSTRAINT [PK_Tbl_Musteriler] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_OdemeTurleri]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_OdemeTurleri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ODEMETURU] [nvarchar](50) NULL,
	[ACIKLAMA] [text] NULL,
	[DURUM] [bit] NULL,
 CONSTRAINT [PK_Tbl_OdemeTurleri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_PaketSiparis]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_PaketSiparis](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MUSTERIID] [int] NULL,
	[ADISYONID] [int] NULL,
	[ODEMETURU] [int] NULL,
	[ACIKLAMA] [text] NULL,
	[DURUM] [bit] NULL,
 CONSTRAINT [PK_Tbl_PaketSiparis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Rezervasyonlar]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Rezervasyonlar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MUSTERIID] [int] NULL,
	[MASAID] [int] NULL,
	[ADISYONID] [int] NULL,
	[KISISAYISI] [int] NULL,
	[TARIH] [datetime] NULL,
	[ACIKLAMA] [text] NULL,
	[DURUM] [bit] NULL,
 CONSTRAINT [PK_Tbl_Rezervasyonlar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ServisTuru]    Script Date: 8.01.2023 14:27:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ServisTuru](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SERVISADI] [nvarchar](50) NULL,
	[AÇIKLAMA] [text] NULL,
 CONSTRAINT [PK_Tbl_ServisTuru] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tbl_Adisyon] ON 

INSERT [dbo].[Tbl_Adisyon] ([ID], [SERVISTURNO], [PERSONELID], [MASAID], [TARIH], [DURUM]) VALUES (1, 1, 1, 2, NULL, 0)
INSERT [dbo].[Tbl_Adisyon] ([ID], [SERVISTURNO], [PERSONELID], [MASAID], [TARIH], [DURUM]) VALUES (2, 1, 1, 3, NULL, 0)
SET IDENTITY_INSERT [dbo].[Tbl_Adisyon] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Kategoriler] ON 

INSERT [dbo].[Tbl_Kategoriler] ([ID], [KATEGORIADI], [ACIKLAMA], [DURUM]) VALUES (1, N'Çorbalar', N'Çorbalar', 0)
INSERT [dbo].[Tbl_Kategoriler] ([ID], [KATEGORIADI], [ACIKLAMA], [DURUM]) VALUES (2, N'Ara Sıcaklar', N'Ara Sıcaklar', 0)
INSERT [dbo].[Tbl_Kategoriler] ([ID], [KATEGORIADI], [ACIKLAMA], [DURUM]) VALUES (3, N'Ana Yemekler', N'Ana Yemekler', 0)
INSERT [dbo].[Tbl_Kategoriler] ([ID], [KATEGORIADI], [ACIKLAMA], [DURUM]) VALUES (4, N'Makarnalar', N'Makarnalar', 0)
INSERT [dbo].[Tbl_Kategoriler] ([ID], [KATEGORIADI], [ACIKLAMA], [DURUM]) VALUES (5, N'Fast Food', N'Fast Food', 0)
INSERT [dbo].[Tbl_Kategoriler] ([ID], [KATEGORIADI], [ACIKLAMA], [DURUM]) VALUES (6, N'Salatalar', N'Salatalar', 0)
INSERT [dbo].[Tbl_Kategoriler] ([ID], [KATEGORIADI], [ACIKLAMA], [DURUM]) VALUES (7, N'Tatlılar', N'Tatlılar', 0)
INSERT [dbo].[Tbl_Kategoriler] ([ID], [KATEGORIADI], [ACIKLAMA], [DURUM]) VALUES (8, N'İçecekler', N'İçecekler', 0)
SET IDENTITY_INSERT [dbo].[Tbl_Kategoriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Masalar] ON 

INSERT [dbo].[Tbl_Masalar] ([ID], [KAPASITE], [SERVISTURU], [DURUM], [ONAY]) VALUES (1, 5, 1, 1, 0)
INSERT [dbo].[Tbl_Masalar] ([ID], [KAPASITE], [SERVISTURU], [DURUM], [ONAY]) VALUES (2, 3, 1, 0, 0)
INSERT [dbo].[Tbl_Masalar] ([ID], [KAPASITE], [SERVISTURU], [DURUM], [ONAY]) VALUES (3, 5, 1, 1, NULL)
INSERT [dbo].[Tbl_Masalar] ([ID], [KAPASITE], [SERVISTURU], [DURUM], [ONAY]) VALUES (4, 4, 1, 1, 0)
INSERT [dbo].[Tbl_Masalar] ([ID], [KAPASITE], [SERVISTURU], [DURUM], [ONAY]) VALUES (5, 7, 1, 1, 0)
INSERT [dbo].[Tbl_Masalar] ([ID], [KAPASITE], [SERVISTURU], [DURUM], [ONAY]) VALUES (6, 3, 1, 1, 0)
INSERT [dbo].[Tbl_Masalar] ([ID], [KAPASITE], [SERVISTURU], [DURUM], [ONAY]) VALUES (7, 6, 1, 1, 0)
INSERT [dbo].[Tbl_Masalar] ([ID], [KAPASITE], [SERVISTURU], [DURUM], [ONAY]) VALUES (8, 10, 1, 1, 0)
INSERT [dbo].[Tbl_Masalar] ([ID], [KAPASITE], [SERVISTURU], [DURUM], [ONAY]) VALUES (9, 9, 1, 1, 0)
INSERT [dbo].[Tbl_Masalar] ([ID], [KAPASITE], [SERVISTURU], [DURUM], [ONAY]) VALUES (10, 8, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Tbl_Masalar] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Musteriler] ON 

INSERT [dbo].[Tbl_Musteriler] ([ID], [AD], [SOYAD], [ADRES], [TELEFON], [ILKSIPARIS], [EMAİL], [SIPARISSAYISI], [DURUM]) VALUES (1, N'Standart', N'Müşteri', N'İstanbul', N'5552222222', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Tbl_Musteriler] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_OdemeTurleri] ON 

INSERT [dbo].[Tbl_OdemeTurleri] ([ID], [ODEMETURU], [ACIKLAMA], [DURUM]) VALUES (1, N'Nakit', N'Nakit Ödeme', 0)
INSERT [dbo].[Tbl_OdemeTurleri] ([ID], [ODEMETURU], [ACIKLAMA], [DURUM]) VALUES (2, N'Kredi Kartı', NULL, 0)
INSERT [dbo].[Tbl_OdemeTurleri] ([ID], [ODEMETURU], [ACIKLAMA], [DURUM]) VALUES (3, N'Ticket', NULL, 0)
SET IDENTITY_INSERT [dbo].[Tbl_OdemeTurleri] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_PersonelGorev] ON 

INSERT [dbo].[Tbl_PersonelGorev] ([ID], [GOREV], [ACIKLAMA], [DURUM]) VALUES (1, N'Komi', N'Komi', 0)
INSERT [dbo].[Tbl_PersonelGorev] ([ID], [GOREV], [ACIKLAMA], [DURUM]) VALUES (2, N'Bulaşıkçı', N'Baş Bulaşıkcı', 0)
INSERT [dbo].[Tbl_PersonelGorev] ([ID], [GOREV], [ACIKLAMA], [DURUM]) VALUES (3, N'Şef', N'Şef', 0)
INSERT [dbo].[Tbl_PersonelGorev] ([ID], [GOREV], [ACIKLAMA], [DURUM]) VALUES (1002, N'Resepsiyonist', N'', 0)
INSERT [dbo].[Tbl_PersonelGorev] ([ID], [GOREV], [ACIKLAMA], [DURUM]) VALUES (1003, N'Garson', NULL, 0)
SET IDENTITY_INSERT [dbo].[Tbl_PersonelGorev] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Personeller] ON 

INSERT [dbo].[Tbl_Personeller] ([ID], [GOREVID], [AD], [SOYAD], [PAROLA], [KULLANICIADI], [DURUM]) VALUES (1, 3, N'Mulise', N'Koca', N'1234', N'kocamuli', NULL)
INSERT [dbo].[Tbl_Personeller] ([ID], [GOREVID], [AD], [SOYAD], [PAROLA], [KULLANICIADI], [DURUM]) VALUES (2, 2, N'Melike', N'Koca', N'12345', N'kocamelo', NULL)
SET IDENTITY_INSERT [dbo].[Tbl_Personeller] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_ServisTuru] ON 

INSERT [dbo].[Tbl_ServisTuru] ([ID], [SERVISADI], [AÇIKLAMA]) VALUES (1, N'Masa', N'Masa')
INSERT [dbo].[Tbl_ServisTuru] ([ID], [SERVISADI], [AÇIKLAMA]) VALUES (2, N'Paket Servisi', N'Paket')
SET IDENTITY_INSERT [dbo].[Tbl_ServisTuru] OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_Urunler] ON 

INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (1, 1, N'Kelle paça', N'Güzel yemek', 3.5000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (2, 1, N'Şehriye', N'Pirinç ve su', 4.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (3, 2, N'Tas Kebabı', N'Et yemeği', 100.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (4, 1, N'Karışık Kebap', N'Et Yemeği', 100.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (5, 1, N'Ezogelin', N'Çorba', 25.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (6, 1, N'Yayla', N'Çorba', 25.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (7, 1, N'İşkembe', N'Çorba', 25.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (8, 2, N'Patates Kızartması', N'Patates+Yağ', 20.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (9, 2, N'Fırında Patates', N'Daha az kalori', 20.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (10, 2, N'Sosis-Patates', N'Patates+Sosis Çocuklar çok sevecek', 50.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (11, 2, N'Patates Kroket', N'Hafif bir atıştırmalık', 30.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (12, 2, N'Sigara Böreği', N'Peynirli,patatesli seçenekleri mevcuttur.', 30.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (13, 2, N'Paçanga Böreği', N'Pastırmalı,kaşarlı', 40.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (14, 3, N'Tavuk Izgara', N'Salata, Makarna', 70.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (15, 3, N'Kremalı Mantarlı Tavuk', N'Krema,mantar,tavuk,salata ve makarna ile servis edilmektedir.', 70.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (16, 3, N'Schnitzel', N'Tavuk Yemeği', 70.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (17, 3, N'Kanat Izgara', N'Tavuk Yemeği', 70.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (18, 3, N'Bonfile', N'Et Yemeği', 100.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (19, 3, N'Köfte Yemeği', N'Et Yemeği', 100.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (20, 3, N'Kaşarlı Pide', N'Patates kızartması ile servis edilir.', 85.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (21, 3, N'Kıymalı Pide', N'Patates kızartması ile servis edilir', 85.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (22, 3, N'Kuşbaşılı Pide', N'Patates kızartması ile servis edilir', 85.0000, 0)
INSERT [dbo].[Tbl_Urunler] ([ID], [KATEGORIID], [URUNAD], [ACIKLAMA], [FIYAT], [DURUM]) VALUES (23, 3, N'Lahmacun', N'Salata ile servis edilir', 15.0000, 0)
SET IDENTITY_INSERT [dbo].[Tbl_Urunler] OFF
GO
ALTER TABLE [dbo].[Tbl_Adisyon] ADD  CONSTRAINT [DF_Tbl_Adisyon_DURUM]  DEFAULT ((0)) FOR [DURUM]
GO
ALTER TABLE [dbo].[Tbl_HesapOdemeleri] ADD  CONSTRAINT [DF_Tbl_HesapOdemeleri_DURUM]  DEFAULT ((0)) FOR [DURUM]
GO
ALTER TABLE [dbo].[Tbl_Kategoriler] ADD  CONSTRAINT [DF_Tbl_Kategoriler_DURUM]  DEFAULT ((0)) FOR [DURUM]
GO
ALTER TABLE [dbo].[Tbl_Masalar] ADD  CONSTRAINT [DF_Tbl_Masalar_DURUM]  DEFAULT ((1)) FOR [DURUM]
GO
ALTER TABLE [dbo].[Tbl_Masalar] ADD  CONSTRAINT [DF_Tbl_Masalar_ONAY]  DEFAULT ((0)) FOR [ONAY]
GO
ALTER TABLE [dbo].[Tbl_OdemeTurleri] ADD  CONSTRAINT [DF_Tbl_OdemeTurleri_DURUM]  DEFAULT ((0)) FOR [DURUM]
GO
ALTER TABLE [dbo].[Tbl_PaketSiparis] ADD  CONSTRAINT [DF_Tbl_PaketSiparis_DURUM]  DEFAULT ((0)) FOR [DURUM]
GO
ALTER TABLE [dbo].[Tbl_PersonelGorev] ADD  CONSTRAINT [DF_Tbl_PersonelGorev_DURUM]  DEFAULT ((0)) FOR [DURUM]
GO
ALTER TABLE [dbo].[Tbl_Rezervasyonlar] ADD  CONSTRAINT [DF_Tbl_Rezervasyonlar_DURUM]  DEFAULT ((0)) FOR [DURUM]
GO
ALTER TABLE [dbo].[Tbl_Satıslar] ADD  CONSTRAINT [DF_Tbl_Satıslar_DURUM]  DEFAULT ((0)) FOR [DURUM]
GO
ALTER TABLE [dbo].[Tbl_Urunler] ADD  CONSTRAINT [DF_Tbl_Urunler_DURUM]  DEFAULT ((0)) FOR [DURUM]
GO
ALTER TABLE [dbo].[Tbl_Adisyon]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Adisyon_Tbl_Personeller] FOREIGN KEY([PERSONELID])
REFERENCES [dbo].[Tbl_Personeller] ([ID])
GO
ALTER TABLE [dbo].[Tbl_Adisyon] CHECK CONSTRAINT [FK_Tbl_Adisyon_Tbl_Personeller]
GO
ALTER TABLE [dbo].[Tbl_Adisyon]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Adisyon_Tbl_ServisTuru] FOREIGN KEY([SERVISTURNO])
REFERENCES [dbo].[Tbl_ServisTuru] ([ID])
GO
ALTER TABLE [dbo].[Tbl_Adisyon] CHECK CONSTRAINT [FK_Tbl_Adisyon_Tbl_ServisTuru]
GO
ALTER TABLE [dbo].[Tbl_HesapOdemeleri]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_HesapOdemeleri_Tbl_Adisyon] FOREIGN KEY([ADISYONID])
REFERENCES [dbo].[Tbl_Adisyon] ([ID])
GO
ALTER TABLE [dbo].[Tbl_HesapOdemeleri] CHECK CONSTRAINT [FK_Tbl_HesapOdemeleri_Tbl_Adisyon]
GO
ALTER TABLE [dbo].[Tbl_HesapOdemeleri]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_HesapOdemeleri_Tbl_Musteriler] FOREIGN KEY([MUSTERIID])
REFERENCES [dbo].[Tbl_Musteriler] ([ID])
GO
ALTER TABLE [dbo].[Tbl_HesapOdemeleri] CHECK CONSTRAINT [FK_Tbl_HesapOdemeleri_Tbl_Musteriler]
GO
ALTER TABLE [dbo].[Tbl_HesapOdemeleri]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_HesapOdemeleri_Tbl_OdemeTurleri] FOREIGN KEY([ODEMETURUID])
REFERENCES [dbo].[Tbl_OdemeTurleri] ([ID])
GO
ALTER TABLE [dbo].[Tbl_HesapOdemeleri] CHECK CONSTRAINT [FK_Tbl_HesapOdemeleri_Tbl_OdemeTurleri]
GO
ALTER TABLE [dbo].[Tbl_PaketSiparis]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_PaketSiparis_Tbl_Musteriler] FOREIGN KEY([MUSTERIID])
REFERENCES [dbo].[Tbl_Musteriler] ([ID])
GO
ALTER TABLE [dbo].[Tbl_PaketSiparis] CHECK CONSTRAINT [FK_Tbl_PaketSiparis_Tbl_Musteriler]
GO
ALTER TABLE [dbo].[Tbl_PaketSiparis]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_PaketSiparis_Tbl_OdemeTurleri] FOREIGN KEY([ODEMETURU])
REFERENCES [dbo].[Tbl_OdemeTurleri] ([ID])
GO
ALTER TABLE [dbo].[Tbl_PaketSiparis] CHECK CONSTRAINT [FK_Tbl_PaketSiparis_Tbl_OdemeTurleri]
GO
ALTER TABLE [dbo].[Tbl_Personeller]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Personeller_Tbl_PersonelGorev] FOREIGN KEY([GOREVID])
REFERENCES [dbo].[Tbl_PersonelGorev] ([ID])
GO
ALTER TABLE [dbo].[Tbl_Personeller] CHECK CONSTRAINT [FK_Tbl_Personeller_Tbl_PersonelGorev]
GO
ALTER TABLE [dbo].[Tbl_Rezervasyonlar]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Rezervasyonlar_Tbl_Adisyon] FOREIGN KEY([ADISYONID])
REFERENCES [dbo].[Tbl_Adisyon] ([ID])
GO
ALTER TABLE [dbo].[Tbl_Rezervasyonlar] CHECK CONSTRAINT [FK_Tbl_Rezervasyonlar_Tbl_Adisyon]
GO
ALTER TABLE [dbo].[Tbl_Rezervasyonlar]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Rezervasyonlar_Tbl_Masalar] FOREIGN KEY([MASAID])
REFERENCES [dbo].[Tbl_Masalar] ([ID])
GO
ALTER TABLE [dbo].[Tbl_Rezervasyonlar] CHECK CONSTRAINT [FK_Tbl_Rezervasyonlar_Tbl_Masalar]
GO
ALTER TABLE [dbo].[Tbl_Satıslar]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Satıslar_Tbl_Adisyon] FOREIGN KEY([ADISYONID])
REFERENCES [dbo].[Tbl_Adisyon] ([ID])
GO
ALTER TABLE [dbo].[Tbl_Satıslar] CHECK CONSTRAINT [FK_Tbl_Satıslar_Tbl_Adisyon]
GO
ALTER TABLE [dbo].[Tbl_Satıslar]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Satıslar_Tbl_Rezervasyonlar] FOREIGN KEY([ADISYONID])
REFERENCES [dbo].[Tbl_Rezervasyonlar] ([ID])
GO
ALTER TABLE [dbo].[Tbl_Satıslar] CHECK CONSTRAINT [FK_Tbl_Satıslar_Tbl_Rezervasyonlar]
GO
ALTER TABLE [dbo].[Tbl_Satıslar]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Satıslar_Tbl_Urunler] FOREIGN KEY([URUNID])
REFERENCES [dbo].[Tbl_Urunler] ([ID])
GO
ALTER TABLE [dbo].[Tbl_Satıslar] CHECK CONSTRAINT [FK_Tbl_Satıslar_Tbl_Urunler]
GO
ALTER TABLE [dbo].[Tbl_Urunler]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Urunler_Tbl_Kategoriler] FOREIGN KEY([KATEGORIID])
REFERENCES [dbo].[Tbl_Kategoriler] ([ID])
GO
ALTER TABLE [dbo].[Tbl_Urunler] CHECK CONSTRAINT [FK_Tbl_Urunler_Tbl_Kategoriler]
GO
/****** Object:  StoredProcedure [dbo].[ELEMANLAR]    Script Date: 8.01.2023 14:27:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[ELEMANLAR]
as
select GOREVID,AD,SOYAD,KULLANICIADI,PAROLA from Tbl_Personeller
GO
/****** Object:  StoredProcedure [dbo].[Goster]    Script Date: 8.01.2023 14:27:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Goster]

AS
	Select * from Tbl_Urunler
BEGIN
	
	SET NOCOUNT ON;

    
END
GO
/****** Object:  StoredProcedure [dbo].[HESAPODEMELERİ2]    Script Date: 8.01.2023 14:27:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HESAPODEMELERİ2]
as
select * from Tbl_HesapOdemeleri
GO
/****** Object:  StoredProcedure [dbo].[Musteriyokmu]    Script Date: 8.01.2023 14:27:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Musteriyokmu] 
	@Telefon varchar(11),
	@sonuc bit output
AS
	set @sonuc=0
	if exists(select * from Tbl_Musteriler where TELEFON=@Telefon)
BEGIN
	set @sonuc =1
END
GO
/****** Object:  StoredProcedure [dbo].[URUNLER]    Script Date: 8.01.2023 14:27:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[URUNLER]

as

select * from Tbl_Urunler
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[34] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Tbl_Adisyon"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DenemeSorgu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'DenemeSorgu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[31] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Tbl_PersonelGorev"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tbl_PersonelHareketleri"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Tbl_Personeller"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'personel_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'personel_view'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[26] 4[35] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Tbl_Kategoriler"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tbl_Satıslar"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Tbl_Urunler"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 170
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_kategoriler_Satısler_urunler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_kategoriler_Satısler_urunler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Tbl_Kategoriler"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Tbl_Urunler"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 170
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_urunler'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'view_urunler'
GO
