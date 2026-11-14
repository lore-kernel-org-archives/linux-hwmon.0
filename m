Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637231;
	b=09JSm90xIwVbbLxFOz97lywwVpQv0LmtW/n7R6AsXzs/9lgTd6NRSZbqi5eKGF2FhQdk
	 FO+PZs8lvE5A8/bg1U/Aqj+jl6qLU4cXvLgaXTgX9Y3XmqiIc/kQfGRNBnFC9ID7fVCwn
	 FWT8ndTrjrmCqJRwwtXJNO7uAgGrxk2cSWupP2lX8PXEm3JucUBBp3afKu7tH8ISE77QQ
	 r7Dl6bgxi730gyyXl36F1fT2b/VvPBT9zBmCYq762+bLAeCibO1F5T5dusgWYJ8S97HgQ
	 bE8x9/DAHQ6/IRfSuU7yeMHbAMt27pyqrsIFSr/VLwR+2s/s2qtV4sglDTaibC+DvWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YaDop3dDW+Ra7JQAGGMNhBuRX2sr1P19swlGlJ+EoZY=;
	b=pWka2XV0ZnrdXQ+XAZsBtbiYNejceeWHFF7vYz0TkmUiUoACdVHBVhS3JD0ihNW1TICV
	 sIiwyEhvnazDgu97mjd9pLQgvT+DSLxAAIu1IVBkJc9mBydyG161upxspvof/C6mt32tl
	 q6/JpInrC3oj5xcCAm6WV3uU5WMBEwNX+dBFJdNWZWX+ra98+jVNdc6FI1Gws4G4VjyU3
	 bN3tCyizzvbBJh/LfdmqmngKgjsPaF4C5fI5PyWyHtYYkzcoF1CrcwAbMmVI9Hi2nVBPo
	 K6zqXr/oo1mKCIcjJ5N1pblb8e/tL9unDkv2EXlVOiTnYzXvKBn+Ou2+ADrzjb8SelA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ew1/oABE";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C130606A32D
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 06:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C130606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ew1/oABE
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3627784c88.0
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 22:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637230; x=1795242030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YaDop3dDW+Ra7JQAGGMNhBuRX2sr1P19swlGlJ+EoZY=;
        b=ew1/oABEMlCvxKhR5/p8peXoLkErkEd153ueW8YA3bNRVAw07Vu85SZELMui/LLRQ6
         MjAuPhnHlrolK5w3qcsuuBWahf2ORzwHaA2OM9WYgf6yk1X3tJQ7nEjlo6PbCWmWbIAv
         DV2VAs/SUXv4oqW1nCAzNOjrp9OX2rxwrQRrDsFp9fAjX1Fz/YMNnCxRHzmFVdFiI3Ap
         +CVxz+5PkyWdzgeO7qBPJPO2mL6uVuGQLKt6GqSTL+J5cUuPjfpR3CMS9r9jidiSLUeN
         FA9/mrVAMfnxGNDuVuHPqil3M0PjULOG+D7QE8QJn0b0cQBhZcbFighI9pf22Cwv4Sv7
         YjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637230; x=1795242030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YaDop3dDW+Ra7JQAGGMNhBuRX2sr1P19swlGlJ+EoZY=;
        b=PGM6IpLTxYmrkB9No4SS1XeCRFr+7GcFeYk4GALeqF6qlSurVb21HNANvZd6CspNQ0
         8rE3f7/UF6wRT93cO3MC/Jtgu/uNpn/ETo8BE7njaOoztrYC8R197R0cyZeGf0BbJnhC
         EkRCKtCtHc7FUypKbJq66/IcdlJiU/WJFpcaWX7ugWyuBaTbEAjEXkaqPmvRViu0X1Eo
         w/+UewLo9H6+rQueBZEeNklOlbT+WF4Df0RYP0ljFl4h/1IUZ6OCjVIwt6eQ8F9PH03E
         p2CQTYLkj3aP/ZmDBelAz+gPEhwpzyDnVEoicX9bZlmj1aB14o/gI2LNa9roaJvtkDx1
         gPIQ==
X-Gm-Message-State: APuU4Z/ginCzAcUcoPp7mLvU0eMk6rEduAla4m1Pr8hliiWLhbJ1zuWg
	TLMKvOcrtcvLUEj2+VKxAoiGeYhWWse/+avCkfol9nV4qLmw5GOvxceg
X-Gm-Gg: AYBFou1GLt6sANiRqDh0SOwJDZNVJgWd+0SEATaAzMDQuoxth6MmM2eMvlachrIZdMB
	x6IiBaArlKO1zKahTmZ3zQl647RKMvpK1rVLuMOx3sJw65G8nYNkCHOzoiM5101n+Qzp44k1t3E
	+pwLa667QZfH4OEagAAaAREhlWbJNofx5FQ/oA+ZpW+qUhtrs2so3HtIHZ2+X1ZRXOVO38qMU64
	e04wls4nuyUcw80bBpIODsSvLudrM7CeGZFkJ5r5hK/U0y+WZ3FP0J6JVHSzsCau8XPQt7c+d4W
	r5oBLugbwImfJsRilw7qaGvS0vQZJ+nFS44JLaD1D4h46qz9AxyLpKeEKjOXK1aHj8Oo1vEXQj4
	5jzUcmgi2Ou5OtlL7JzBDYVXcd2eBKiXY4WqozYI2tithL9P6twh9dzVcy9Gx8pXw5/7WsV694U
	tYDyb8digJazeihbfr0n6knfrxphPXEePXZbTK5QwNsLAJndtl4dKEZqgc91XCBRqckdQ7uydKF
	dceJ+TGNkN+E6X7WznRI6eqMiu4GneajSrNPyGMrNpcfnRw7WsmAEwykE4c2o2BwLfuSbspl2tZ
	lGQ8HzQcXZSEchwpvQ8idf72QkJtBGby66VYZ4XphNho8IQfJfWJhQYT4v7yY89ZRDcMf48j0TH
	ok8xPA3eFXqmDJBuV8nbbBc1vSp75pLycW9ZepQArhVG7DW1n0YIHEdPiKKcw1MUsc316swO+Pv
	+IjA==
X-Received: by 2002:a05:7022:b881:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5031124f0mr4696379c88.25.1794637230452;
        Fri, 13 Nov 2026 22:20:30 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm13305738c88.14.2026.11.13.22.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:20:29 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (dell-smm) Validate pwm and fan_max values
Date: Fri, 13 Nov 2026 22:20:21 -0800
Message-ID: <cover.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two input validation fixes for dell-smm-hwmon: a huge value written to
pwmN overflowed the scaling and turned the fan off, and an out-of-range
fan_max module parameter could wrap an allocation size to zero.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
fan_max=256 and fan_max=4294967295 are rejected with the new message,
fan_max=3 and the default still load. The pwm clamp could not be
observed: this machine's BIOS ignores manual pwm writes.


Rosen Penev (2):
  hwmon: (dell-smm) Clamp the pwm value before scaling it
  hwmon: (dell-smm) Reject a fan_max that the BIOS cannot take

 drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
 1 file changed, 7 insertions(+)


base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0

