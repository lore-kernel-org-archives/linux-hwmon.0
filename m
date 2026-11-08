Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158817;
	b=40w6UEMxH/9ETRNO1zW36KNBsN9NEYOzzTzHMjyE61CN4ZYySgE12qfnjZg3TmlTYw2i
	 1GowBkMqqj2W80udjGoPM7gqVqz0Mm0LfF8bCSh+aPHqTaK9O1MFigEEOrJe/1yBqaITW
	 7iB6iS15cxn0Y8LfZQJCWdokrb9ynTxPDkYt3LkX6USJAIz4gjmujOOlwAc7nS0Ox8G4G
	 kP3x2cOwR6EuRl3ny0ETULFAOY4JDMGelo5E9jIFA7FWQT5vKDAkOe9EGNWARNJfT65gC
	 g6p49RYVyiNwBfi/sBq0bJEdyYo4xJsg1EZBb3QBaLJ+Qjl53Ik8RY6sg+O1fT78tbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158817;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=CbdDB+kP/MHD2Y+SM/e0nRF0wnRfuFbFe0PB8gpPvIs=;
	b=wZHRV1LjdQYMtouo5Nq8xU47NPx8c0NWaasIvy+rL6MMTArOwoCLl+fK38KdFgqKbTgL
	 ZCx/X71HIJAxS3e+QxLA7Ph6HTgP87xY/6qy3aSDVKsbUdLWmhYBW6UCh6miMlrVYS25i
	 i2+b04CEsYPXf4YzfH17S6M9zpIkkFk+4pzJlTCkOczhLvPmEFONvnHaHQ5iXGDy0wpBi
	 QywlKSGU/d0pnmRa98+7TFmln1p1YnMpWdRlqO6YwM5XAsxgbyH1bsLgc8CLwZbxf2+Wu
	 gEaLMIN5aR0lE9ILekbCarOrrHwTkp/zLVfO7Q4p6StI6Cup/VmRgfyv06JcJOcrKqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yzm+MjtH;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26266606A320
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 17:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26266606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yzm+MjtH
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5c1479be604so77923e87.1
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Nov 2026 09:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794158815; x=1794763615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CbdDB+kP/MHD2Y+SM/e0nRF0wnRfuFbFe0PB8gpPvIs=;
        b=Yzm+MjtHoqQiYFCsrsPT6q1xSu86CObzvUCbrJXamBuvYNMoqEeQ8DaZMqeF4no+r+
         yLlsJNsRzyVBdZrDHlei4OmrPhRCccrWouSyMJg0V10LHhnEeR1rmI/CwbAek9j3sH9Q
         GInmRmftGwzoFJugziXeoaS5EZSARLw7b5//QcaSTMKov+vux5gBzwI8vC0yRuIhxCfu
         sOmxwGLv3kZh7x0+bGdzjGTeqeuWTK0cDM2Grb5SNEYdDZAJEzZbqMaVnrq8ko2ZBYE/
         aMi0a12Ptej6LErfKv/YBcL0azS0Wt5TfOzuX3j+lNtT8wrFIDGFros6gVmx+9pmJhhF
         06uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794158815; x=1794763615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CbdDB+kP/MHD2Y+SM/e0nRF0wnRfuFbFe0PB8gpPvIs=;
        b=a6a+V79KLrkyHzk5P7Z7G0WX7oeyIhG8B64NoAUWU6VDQAFIw/Ad+D1BmFMENDRcff
         og9EN1c9wHVtpdIhO1o0+87mVzOeyyituR1aLqncpkqrCyTUTptllpglunCY88QP4kOS
         rz2/wHMCZlwOFgWHfxZ/zy/vulg/0L/VnP54P/+nY2lAUZRP+HZhz6XpbYal1nv79xHj
         q7CgIAXvTKSUPziCs6SHoeb0yrSQagcHGNWjdaetlXk3vZCwh3Sbw+kETExzLzaTqLNp
         pfxEUaAQcXsuXgUSotXPXgUbVKf5eHY1SF6zw8N6SD/iWtlz3GKu47aa5vDcrZMA2UKy
         3nrA==
X-Gm-Message-State: APuU4Z8ghTBg7JeM8iG8UZY3QhWjKCFIC06Aw2t7oIdcRx9GDdbM0mgs
	KmFfi6KH2k76rJKeormbNSOaJCtFVRvFvtqFwxuchqoN+SfGtzQBcZyo
X-Gm-Gg: AYBFou09orqtsOtZbgisWIUWlyddXeogQM/RAXyIeeSRfhjVm4qxiQJliDxHmmnKNBt
	DI2OT6+iao+7fHppmmg0YqfUh+m1KxnCd/PBfAPwiI4tLLvWTGWECFCxjK5cIVNaoddza046ip2
	hpzDTFfBjWTn8Mf5dgYkj5iMbNFmmLSDyrLhm6rfogk3SMbaBajqzdNK6hWnIsuLu86Q6roLNYE
	SYutF2+gipvYay221T5bjj4LmvM8OcQUQSQKJdAEEQOnOXT+cZj7POEEEYEPfTCnTJMz1BhwHrv
	kP56QrwUk60tDyyUSDPIT2II5p5bJOlN8O5qGn49jXW6n4ETavNxUJLyGXl+hnZlDduxUGzb9Ii
	GHmqRbZI0BUtk2R50URm1B59Rn496fMHULWnLVZZ3QKrwsdfqfr4NUdJbStk0Qg/3bT5bgjjz+5
	GpWDOkfKxvO7Snrs0J/FCXTnHUdvMcCbWFMMTphj5ExENIXsOnmK+49lc06RJSAzYkyhpFzBAjb
	OiUS75Jamc1d85bUGn4mYBhamLwpzxntctbBimRgLlAgjSR3iqyZzKQ2UTEgHjs/B9jjxuHvVVR
	T7TJzzsmj3PgHQpCSynFZwBUcZsiOchrlMr8t8p9EIAP1rs1CC5tn8aUxeyriFyfzLxGHH87isv
	GWT41kBULDX8R2u32ajFOxuAxmZK0ZWJnykcc7pA=
X-Received: by 2002:a05:6512:3ca6:b0:5c1:4a79:b9c3 with SMTP id 2adb3069b0e04-5c14bfe48b9mr460728e87.23.1794158814973;
        Sun, 08 Nov 2026 09:26:54 -0800 (PST)
Received: from yantra.. (nekmmqsilaajbsz5p5z-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:1eea:2a90:84e5:71a7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b7fc37csm428983e87.29.2026.11.08.09.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 09:26:54 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	"Johannes Cornelis Draaijer (datdenkikniet)" <jcdra1@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH] hwmon: (aht10) Fix update_interval overflow on 64-bit
Date: Sun,  8 Nov 2026 19:26:51 +0200
Message-ID: <20261108172651.220121-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
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

On 64-bit, update_interval writes are clamped to LONG_MAX ms, but
ms_to_ktime() overflows above 9223372036854 ms and the interval wraps.
LONG_MAX becomes -1 ms, so every read starts a new measurement and
update_interval reads back -1.

Clamp to INT_MAX like sht4x, so the limit is the same on all platforms.

Fixes: 8c78f0dee437 ("hwmon: Add AHT10 Temperature and Humidity Sensor Driver")
Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
Tested on x86_64 in QEMU with an emulated AHT20.

 drivers/hwmon/aht10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index 6c263cb57766..c9ee50883f5d 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -222,7 +222,7 @@ static int aht10_read_values(struct aht10_data *data)
 static ssize_t aht10_interval_write(struct aht10_data *data,
 				    long val)
 {
-	data->min_poll_interval = ms_to_ktime(clamp_val(val, 2000, LONG_MAX));
+	data->min_poll_interval = ms_to_ktime(clamp_val(val, 2000, INT_MAX));
 	return 0;
 }
 

base-commit: f4e680ffc2e50867c5b590e26a37f8801a31e486
-- 
2.43.0

