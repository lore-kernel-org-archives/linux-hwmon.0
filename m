Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7A9217F3D
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Oct 2024 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729930099; cv=none; b=Se+sKMHuY3A186EhtNtL54vWDLzCzZ4APhvbGI3XUv7xTycFcCCQjRaKJ00HQzOjXdkQ0WtFD/r6GndzbgAId6hNiP2tOSYW5znpjmJaWBtcLCX45HrbvNEGZaPvCttJE68yfUXqiYz5vjYtwKTT/N/TvXLcfKfxFvc46qAFqSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729930099; c=relaxed/simple;
	bh=g8mree3qD96qt+EmXfdq15Ufm2ggSgiN/BnGAz2GNQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ome2nD0onyVchPq+Gp9Ria6OD3e4vY2kluMe5nJE49QNRi+AoK73Lok3ITPow0pcz8tiH4ZLEEHHeXrW9w6+ZUxHaPHFbnFxIhOuiHmBxc+g5grSqW+S6Rfxf6pECdV6Ee25PtiW/rFWvUR3Na/gxMOsQS0JWqAp6lGZZoNl+jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpKGDeXn; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpKGDeXn"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6cbce9e4598so17291966d6.2
        for <linux-hwmon@vger.kernel.org>; Sat, 26 Oct 2024 01:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729930096; x=1730534896; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g8mree3qD96qt+EmXfdq15Ufm2ggSgiN/BnGAz2GNQs=;
        b=EpKGDeXnHUZ9BiYp3cc9sdTJn4C3YQMD1Y5cVmynbBXQ4xAgOMUi25sNJHg9gksJA2
         83tYlzR4GYu/nMRYSw6slDe4mPJZf9pDV6QDZ3+aw9vQv3jvikCiEH28J3LdhsmUJeDx
         nVrSUKM0lh7oCQdJTVN1ppoyzmCctyAAZcVAl7cib/j4dNpZ2FXNoJCK4VVrRL8il9iw
         FCxoB2hliDc2NoAJQYb8AfH1KrA5x7Zbvx4D1dD9gdGFpGMEMSLHfFiVRfGrZcGEJT6L
         DF3MsDUjC0/PThQUbdyIcW7mfETiNzdp2qYn/x2IngB9WfkHvHHpFKzyOVtr5NhU0XY9
         yegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729930096; x=1730534896;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8mree3qD96qt+EmXfdq15Ufm2ggSgiN/BnGAz2GNQs=;
        b=eWfSkiljs0s3F+35Y4JdPY0t9Quxy7tf6/vX0nasTuFo9l4OHNRxS5RuV/O5PO/dbi
         N5qUHvpFBio3vOTeE65JGC9f+KN/0VqCPaoEoYvNO+Workrms4qAMGMCRr0ND/rTVRBC
         awql9qUxYFogtxbOu8rXWWtE4B57DJq9xawn+J5mN0zhRbMLNBWwGzuxKuOJlROsxbMi
         guPMJXzl0vWgpGYNRBQ8dBlLrcyaoSBB7mPxxmNoRSN7a/uTGTwBF4sDKILy1ri0IOBr
         4WMzcYsrMIUR2JIoU86pfg08UpM+3yXs8PtABYTpPDY7UAJEgSAsCevJMpCpRKJMCXPf
         UPRA==
X-Forwarded-Encrypted: i=1; AJvYcCXu4kWlTjY2bT9Btd4ETdxhXDbss0pKl6IT4FO6nbsS7yh1xMMsakjPZMkcX0cFXwm5HAqdubTRqWgxZA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzv8GxRAZ/LGwfeT10cdQIytWYaMEjm3tOKjlwwceEkMsP7xylY
	xc2ZFbZamp/ALk3yy6DebvadY4d/eT7s/i2mkDCN+QnMEZJo+O4hW71ee/w/Z/XgpRChO4qSJhh
	GR5v2YfAEjSJwhm7Ibwu7CoVigXWes0Km
X-Google-Smtp-Source: AGHT+IETzUX/oQIqVJBLrUnTUASPRcKoCflD/pzp4OX8HzkGgSpAUUIp3DvhpUPa5w8HK9RJxTuEAT2FyGAlw43MvIQ=
X-Received: by 2002:a05:6214:5a0b:b0:6cc:2d3c:6472 with SMTP id
 6a1803df08f44-6d1856b4898mr26880816d6.14.1729930096029; Sat, 26 Oct 2024
 01:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20210923023448.4190-1-akinobu.mita@gmail.com> <20211011143421.GA2374570@roeck-us.net>
 <D056E665-7386-42E0-8A16-383B66FA3179@aspeedtech.com> <OSQPR06MB7252105381A0A3E8E7B80F6F8B4D2@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To: <OSQPR06MB7252105381A0A3E8E7B80F6F8B4D2@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Akinobu Mita <akinobu.mita@gmail.com>
Date: Sat, 26 Oct 2024 17:08:05 +0900
Message-ID: <CAC5umyh8QXkUnqJFs4TK5YpvjSB7tJV3pFGv8ChsCbDfDS4zFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (pwm-fan) add option to leave fan on shutdown
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"

Hi Billy,

I have updated and resubmitted these patches. I don't have the hardware to test
at the moment, so is it possible for you to test it?
