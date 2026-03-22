Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57C13630AB
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774188251; cv=none; b=AvTWY+qCAJRQLPEOWoOQRaBMWL3r21uhyzdg3TV3Xindou9eFWbjp9bDZoFsVNZE0uoRqdsv/+5w3FN4SdSZsEa4R33ShqPAZw5iveZwsdudMHH9IhzD4O932RgB+GG41M3gd7MgYWPRZeNFqe9rz6Uoz/2+7DGLvCBeNXT6SXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774188251; c=relaxed/simple;
	bh=kleqhKDJCrtcsDaxAvNfWYSxIZN35cut2v2eKBVNGQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGthVP97SPcYoirOyHLSdDXyNQrbQAN0RuAKybHHx4um923nV6xmnFKmRgqsh5/io9DZv1H81hcPtA6Qlqq2XHCaZ1VKbdzvpkRBGGA636PhPDjraTWitPxK1/4eqDd2JX1mCnopgpXaGkjpHum4YNIqhtElxGKiSdO736DjV5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8j1ML0m; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8j1ML0m"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35a04d6aeb0so1570685a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 07:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774188245; x=1774793045; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Om62ZHYYhsdbwrAecfOZkotql+ByDyTBZl1FPZQRJOY=;
        b=P8j1ML0mTY0aTnVl4ZaX/sVj+oOaGiZ7PHqF5R3IHE9GcRULClRpNObJ69dFYg0H3Z
         3xnak2DA8Yq+Q0fFQOiULHWpEB3YZXlrxORc9vVbD2htxVH8wwKYk9LMH6up42455GmZ
         rv58dOtvcQAYzh0Ihj5Tbe1hQuvBD8yQKF9orVGH1/IB2rS371cOsipgljqCd+BOmg84
         RsA7tOqTuYtOxQyAFvryUM8kTsIs48p3I6DwkXD7/NeXQxrazMfuRG2MFDBEkN1X6Sut
         6lCoiSthW/78+E9Jgp5qbFosHCf4zAiAl1CsrgypQWgLhY3Q4DhImrAkIWDCuhpTDoTl
         vk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774188245; x=1774793045;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Om62ZHYYhsdbwrAecfOZkotql+ByDyTBZl1FPZQRJOY=;
        b=HYXa7iZvvDpF6l4dWOau2HTBwxb4vZmmZcqv9yDnIhfObcibDYn5yDRDOdr1DnJ+lH
         VeUlMZQZVvWvRwDmwvmmyDWQRRl05js3dYvbQVdhLZdZrnpPK8I+d1ftsDF0313fjiUv
         sRZGjGHXMxdlgLR3Go3EHOTae6gJKq5yPcgtnG25+sQZTLfO4v7iLTm3xuAxaIn5t39k
         RsCZVXs/6QcjDIeYJdb37/L6K86MzJg7y6yahlzlYMmp0fdYyom1GPfoyLTeXGtK6LOF
         oAsXG9WBO6kMfd8Ow33HBENgZCQaIRxXA985xPAZUH10YT6Ymt+BkSEfeOPGZuMEOSsv
         3PRg==
X-Gm-Message-State: AOJu0YyMx2PwYBLfNPcrR5tcidh8Ubyda7NYOrkPp4BmTAHp6ToVWYs7
	1JDR1Jdz9KwWI8RhOz+fsmVTSlHB+kewXuMgjFCpTrgQL1Jczg7FnNbsdSsNaQ==
X-Gm-Gg: ATEYQzxuOq0lO+GXjyuq8obbFs1N+xqm4b8mJSYPZ57li0c62P3AykDdjvkKjFW/nFS
	QGvZNJf61gD7EYKdApw9wBq46Gmio8KQF45t6kgq81CWTXnJl7YP4j2W2iwNZLRznpr+SfAN6m4
	K0h5TBbBRrZ7FnG3BSZLRpi2T4qAkkKS8irHrIlQy3sZIvUyvZRjJp9HX+QFPIDkRL6pPqQcuI6
	u1lkCwGJWk+jOcChYkLrAMFVjSj2kpvXREJ82Cvhn+7kcuMueZsCtBGv7pFkh0o9sAHc4ybLTPF
	mRUBzZ7htr8+hBLjlRZpqLyBeuk1rD9OaLepHJQ1lBHKT93oIoIpynesaDNZq/dJxobcmME5A+a
	HriRbXfVGglgmYTTF2TYtHqBcAKqa/n80/8pnCRUQe55oVB/Xsoh4CW8qqZc6w6x4K8G1bvUhVl
	GCNtaNHQATb8kny1MDokxpWj7JjepXuLuJGhNf
X-Received: by 2002:a17:90b:1a91:b0:35b:929f:7e95 with SMTP id 98e67ed59e1d1-35bd2c20675mr7870590a91.4.1774188245437;
        Sun, 22 Mar 2026 07:04:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff7090sm10184065a91.3.2026.03.22.07.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 07:04:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 22 Mar 2026 07:04:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Denis Pauk <pauk.denis@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	ptscheepers@gmail.com, bugs@bzatek.net
Subject: Re: [PATCH] hwmon: (nct6775) Add ASUS X870/W480 to WMI monitoring
 list
Message-ID: <e871cd9f-2f0b-44b6-a693-b3fa4c936d91@roeck-us.net>
References: <20260322131848.6261-1-pauk.denis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260322131848.6261-1-pauk.denis@gmail.com>

On Sun, Mar 22, 2026 at 03:18:45PM +0200, Denis Pauk wrote:
> Boards such as
> * G15CE,
> * PRIME X870-P WIFI,
> * PRIME X870-P,
> * Pro WS W480-ACE,
> * ProArt X870E-CREATOR WIFI,
> * ROG CROSSHAIR X870E APEX,
> * ROG CROSSHAIR X870E DARK HERO,
> * ROG CROSSHAIR X870E EXTREME,
> * ROG CROSSHAIR X870E GLACIAL,
> * ROG CROSSHAIR X870E HERO BTF,
> * ROG CROSSHAIR X870E HERO,
> * ROG STRIX X870-A GAMING WIFI,
> * ROG STRIX X870-F GAMING WIFI,
> * ROG STRIX X870-I GAMING WIFI,
> * ROG STRIX X870E-E GAMING WIFI,
> * ROG STRIX X870E-E GAMING WIFI7 R2,
> * TUF GAMING X870-PLUS WIFI,
> * TUF GAMING X870-PRO WIFI7 W NEO,
> * TUF GAMING X870E-PLUS WIFI7,
> * W480/SYS,
> * X870 AYW GAMING WIFI W,
> * X870 MAX GAMING WIFI7 W,
> * X870 MAX GAMING WIFI7
> have got a nct6775 chip, but by default there's no use of it because of
> resource conflict with WMI method.
> 
> Add the boards to the WMI monitoring list.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=204807
> Signed-off-by: Denis Pauk <pauk.denis@gmail.com>
> Tested-by: Tomáš Bžatek <bugs@bzatek.net>
> Tested-by: Theunis Scheepers <ptscheepers@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/nct6775-platform.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
> index 555029dfe713..1975399ac440 100644
> --- a/drivers/hwmon/nct6775-platform.c
> +++ b/drivers/hwmon/nct6775-platform.c
> @@ -1159,6 +1159,7 @@ static const char * const asus_wmi_boards[] = {
>  	"Pro A520M-C",
>  	"Pro A520M-C II",
>  	"Pro B550M-C",
> +	"Pro WS W480-ACE",
>  	"Pro WS X570-ACE",
>  	"ProArt B550-CREATOR",
>  	"ProArt X570-CREATOR WIFI",
> @@ -1258,6 +1259,7 @@ static const char * const asus_wmi_boards[] = {
>  	"TUF Z390-PRO GAMING",
>  	"TUF Z390M-PRO GAMING",
>  	"TUF Z390M-PRO GAMING (WI-FI)",
> +	"W480/SYS",
>  	"WS Z390 PRO",
>  	"Z490-GUNDAM (WI-FI)",
>  };
> @@ -1270,6 +1272,7 @@ static const char * const asus_msi_boards[] = {
>  	"EX-B760M-V5 D4",
>  	"EX-H510M-V3",
>  	"EX-H610M-V3 D4",
> +	"G15CE",
>  	"G15CF",
>  	"PRIME A620M-A",
>  	"PRIME B560-PLUS",
> @@ -1320,6 +1323,8 @@ static const char * const asus_msi_boards[] = {
>  	"PRIME X670-P",
>  	"PRIME X670-P WIFI",
>  	"PRIME X670E-PRO WIFI",
> +	"PRIME X870-P",
> +	"PRIME X870-P WIFI",
>  	"PRIME Z590-A",
>  	"PRIME Z590-P",
>  	"PRIME Z590-P WIFI",
> @@ -1362,11 +1367,18 @@ static const char * const asus_msi_boards[] = {
>  	"ProArt B660-CREATOR D4",
>  	"ProArt B760-CREATOR D4",
>  	"ProArt X670E-CREATOR WIFI",
> +	"ProArt X870E-CREATOR WIFI",
>  	"ProArt Z690-CREATOR WIFI",
>  	"ProArt Z790-CREATOR WIFI",
>  	"ROG CROSSHAIR X670E EXTREME",
>  	"ROG CROSSHAIR X670E GENE",
>  	"ROG CROSSHAIR X670E HERO",
> +	"ROG CROSSHAIR X870E APEX",
> +	"ROG CROSSHAIR X870E DARK HERO",
> +	"ROG CROSSHAIR X870E EXTREME",
> +	"ROG CROSSHAIR X870E GLACIAL",
> +	"ROG CROSSHAIR X870E HERO",
> +	"ROG CROSSHAIR X870E HERO BTF",
>  	"ROG MAXIMUS XIII APEX",
>  	"ROG MAXIMUS XIII EXTREME",
>  	"ROG MAXIMUS XIII EXTREME GLACIAL",
> @@ -1404,6 +1416,11 @@ static const char * const asus_msi_boards[] = {
>  	"ROG STRIX X670E-E GAMING WIFI",
>  	"ROG STRIX X670E-F GAMING WIFI",
>  	"ROG STRIX X670E-I GAMING WIFI",
> +	"ROG STRIX X870-A GAMING WIFI",
> +	"ROG STRIX X870-F GAMING WIFI",
> +	"ROG STRIX X870-I GAMING WIFI",
> +	"ROG STRIX X870E-E GAMING WIFI",
> +	"ROG STRIX X870E-E GAMING WIFI7 R2",
>  	"ROG STRIX X870E-H GAMING WIFI7",
>  	"ROG STRIX Z590-A GAMING WIFI",
>  	"ROG STRIX Z590-A GAMING WIFI II",
> @@ -1451,6 +1468,9 @@ static const char * const asus_msi_boards[] = {
>  	"TUF GAMING H770-PRO WIFI",
>  	"TUF GAMING X670E-PLUS",
>  	"TUF GAMING X670E-PLUS WIFI",
> +	"TUF GAMING X870-PLUS WIFI",
> +	"TUF GAMING X870-PRO WIFI7 W NEO",
> +	"TUF GAMING X870E-PLUS WIFI7",
>  	"TUF GAMING Z590-PLUS",
>  	"TUF GAMING Z590-PLUS WIFI",
>  	"TUF GAMING Z690-PLUS",
> @@ -1460,6 +1480,9 @@ static const char * const asus_msi_boards[] = {
>  	"TUF GAMING Z790-PLUS D4",
>  	"TUF GAMING Z790-PLUS WIFI",
>  	"TUF GAMING Z790-PLUS WIFI D4",
> +	"X870 AYW GAMING WIFI W",
> +	"X870 MAX GAMING WIFI7",
> +	"X870 MAX GAMING WIFI7 W",
>  	"Z590 WIFI GUNDAM EDITION",
>  };
>  
