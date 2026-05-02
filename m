Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FE82DAFAF
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 17:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777743159; cv=none; b=EHIzwJSfi6c9H6VpHORtsFwHk9wCP/UqZvLb20TYmWGkSxu+oKN5ih9DSFXT1kGsA6Ihirx9gAvmnhrhVA8ZZtkIcFPjbuN93U/5Ax06OScocdlIfvUb6bxxfQVwfwSdaR9yAO3xrOPYpEx30JKfdTJEA+AX8a5M99ZSJP6a7E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777743159; c=relaxed/simple;
	bh=EnZNfuC7PKcAflg6/Ks0V4y3o7bXQrJoDSjZ2IUwBW0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mPKqjF5ae3t54cIz+cRUzbFSaiCxHdc7LgSUMFjsCkfqTFF1dscjgUFg4f6gAT0msBS+iqtTB3Xhq3B2AjneIzGjFfgPyX13dOSGZqrBz4twc6wZCcDbQTBQOCv58Wr69leVcEl6kBk54FCEPW4tW7EpLnGgON3x0M3B6YjQQQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=LiuE/qTf; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="LiuE/qTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777743137; x=1778347937;
	i=markus.stockhausen@gmx.de;
	bh=NRr2caIiTSEc8mmI62bwEJFf9X/pwAbelq6LDPA6bwU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LiuE/qTfg86f0hMCJ8adaSUX+AQXZ+aWkR50NZASi9oZF0SaiQNOPVHEcnNyLPeo
	 5JUMIOIdwccQAZAQ6dN/vgLkYIwO9HppK5IJY1vZmp0Pebt36AV3gjKGebk7ttEG1
	 ZVgU1P6K+V6YnVtgq2/i1kB+LsC/LxZQcsPGXm1KLai+Uvkn2LkGqWEQ+SO/5J2Kf
	 0A7O+V1N2bc/uVjpKdbd79WVYwAmWsUf46W+/OZb+8eWuAJThv2gAwMPXsV31YPb0
	 oUD1ggonEyYn0t28F5BHR2H3ut0HoIIDMI/A8kvO6/L647FFdoAoDL9Z38VAwZGpl
	 Xf3wMhRo+oKwYesoYg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mBa-1vKuPF1Rts-00t6nj; Sat, 02
 May 2026 19:32:17 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	alkuor@gmail.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH v3 0/2] hwmon: (lm75) Fix AS6200 and config register handling
Date: Sat,  2 May 2026 19:32:05 +0200
Message-ID: <20260502173207.3567876-1-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Zco0iHvc3JhDhMIzUBxD2Jf+pefaXXIQc29Y8z3WC6QN/4Z6Gl7
 8iRyl1x/9DIV9bcHQSqMVmDVEVjhb5zhrjf83pUrLJ0sKy8lzHRG0UHZWd7g1NOmzm404Wt
 fJTGayzKJtYLn9llA4YLUXNzXva77g0XbP+8NLpKjZikn2Edc78/fkyLNJCMcj9jaF0P0iE
 uZAcxHW/nEuoBqkiIN1gA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/OAItqDh+Fc=;TN0tv0ouOgqffprdERbF1F0yQpd
 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

This series fixes two issues in the LM75 driver.=20

1. The AMS AS6200 is not initialized as documented in the device-add-commi=
t.
2. The lm75_write_config() skips bits during initialization.

Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>

=2D--

Changes in v3
- Adapt hwmon_temp_alarm comparison in lm75_read() to check for equality
  of bits 2 and 13

Changes in v2
- Adapt hwmon_temp_alarm comparison in lm75_read() to check for inequality
  of bits 2 and 13.
- Reword AS6200 fix to make clear how single shot configuration works
  according to the datasheet. Add explanation that config register is litt=
le=20
  endian.

