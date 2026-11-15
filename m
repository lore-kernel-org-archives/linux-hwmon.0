Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794709265;
	b=CZ1GDTOIZ4bGLXPj3ohrfqinyEla/YgBKQ223zXDFHU777KarEQFYqPhggTeHbODMUr1
	 gWpUlgmCPBA2/YNsEjQDC9uB36NcA2hTh4CDhQivM5FZ8UtDe9ZWMaG5O9wFeyH/t+jhK
	 LmL21NhuJxJHCJ4uQARGVhWhtYfplkdwOyciOfQFx1bW2laN34Orxs9X4Snx6pJbOcnLd
	 wzyOK6R/0kwagEN1/6TPKyTAP65UEf7GV+0CMZMgOOlD+QeO9muLOBKjU9+PCL8Ks6rAg
	 7MpLqprQRXXwlMIdOjztsPT4lIG0GV/8CCjN0hgKDIqXZkGvcY+CAdCou7XDAA+4O/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794709265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HGWZVbmBOvvdDb5n3MKP7TgXPcoDYYBkGOcK1pQmOjA=;
	b=sIbMzM/V9FAcJEMjb0H616GRjc6vPf8toLlhY+fVJWvBNy6aICa7h0dXUXsgJOMEH7J0
	 gKTE+/+zCqYSNRUSpXMwhgqhk0AAKeGVtpgUYc4ovdpzLlbd5xBtpLR+dCJkswQM7/hXl
	 JdaCofFnpHdh9lAA/+0RqMlT/xKfNexoLLeBizVH10/e4loBtbj7N2tKmf2DXXF74Er+C
	 13YAMgK2AqHRi1J6awFmneLuoRC9NL0LA82Z4csVjuiJzDYANPvmBqXdn/kOR8GlVRZgi
	 yTTTfWw81K72a8e59J76bFzxlJ+bbCGLA9GksMIqWoSxN418BGWke2cSEWE6p3GotYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vrzMUI6X;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29532606A323
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 02:21:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29532606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vrzMUI6X
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3b4944abeso354216c88.1
        for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 18:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794709264; x=1795314064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HGWZVbmBOvvdDb5n3MKP7TgXPcoDYYBkGOcK1pQmOjA=;
        b=vrzMUI6XZUJdPha2FaQ6yhZRQq7aLNBeJbPoba/eLCIu+GvTD9bfrCCOeVtZCC1/Wz
         hAo/abz9YDyxeVEczm7hmC8GDR3nibAMLCnX4NsPcXmrJJjhlnpnKgC6Q7Tea7RsZaR2
         hv94aGsCbSOnWhiIHEB7aSVCMm2k1/tCDBXFvLBCVnwngN08n1IT9bUpzbVUFxXzpYpS
         n9oxJraOEHVOXOlOEpwWzkoc2xvaYv7BSO0b1Rn/aVTTaGxYXVfHwbT/baKBWDkDEe4z
         bd/C1WZiGpK0h98iu8F+seFc5QMCxXQ55ZwbLAO0bSEHtIAFB4nytTZzFcd6Cn9mlSlg
         YtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794709264; x=1795314064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HGWZVbmBOvvdDb5n3MKP7TgXPcoDYYBkGOcK1pQmOjA=;
        b=iza7J51gfSlM0bGVs+qvINTtLlU+efUWz+qobZkXLDrBUZOA3TFS6+hV/i9VcL6CWp
         FRnrcg0vbemDCPDG3eoPj9AWf9IGZ9gRG6Z30Ug0F29NwQfwdRP36ucfa3KrVR5zLAHP
         KzmRgTF1eZPQrTeQhoe+MshWpw/mlH3JbkQ4z5rhwJcvsjGCH+C/XtHZI5zVa4CvWdqF
         f2rGZgxUQdegV010xVQQquSuraNx+6iMmB0/+tYfikmnGI5NwYxBqfjllGMZAPQ5FGoQ
         Wf+GnOHbKHKxe4fk9Qm1nMO96sW0lkL43vGLJcDLSKDCs6KCD4H1pvVRwDvbne22la0Y
         UuSw==
X-Gm-Message-State: APuU4Z+61NXm2UkWq0/CRvt4q+sWlEeR9+SoXFaQmGnxENaMviIoVNsD
	M6j9S/x9AEtgFJ27fZbEEC52ZZn28CAWM6mGKBBXJ67SJEQIq9mBftr9
X-Gm-Gg: AYBFou3B80ttgCdfUJsCKdrlXNQaAISgyREzIJ7UTP+5fFbx4UsYVvNPjn6uVVW8v60
	HDMIwo/YhALpkxJjyU4WzyzhXSYAsBHSAlDl7f9KoFxDVJtX22uws27QlFf0ejHxNZSyNbAy1NM
	7Uo4M/uqJUC4c7rMLIzPQVWBidBlCM8hPKPGne7E/wTirhOoWjx3Eka0gMd4OYMnxoeKhvgGjgb
	AVwSCh6er77nlRUZncwFdrU3y8Q2bhpMoa2w0H+c788Y9yfPnbgED2ogA6EvCLErJysyp4U3+Bn
	6M/Qp3/LrIDYpa/coU9/dUbufrobwUzGGUxuVWukCqhaehxmMRXxaZUH+swy9qBFKFmWMfZL7yS
	l4Zj/UZHYnSsJID4DyPeMqkJQ8OqPvRHgy/4QMe1EpMsVAnKEpAOYG0zBXezFFJLfAZrkml5lqY
	YgSM4l9LbFFxpw2+fl4pqMlEW/+A3yYJAcyM/dqjWO5lCv3673e29eKKVJ4w5qugi/UNHj6Wuaa
	ORZxOKtuQaq79lfdVx8WWtcvlHIEqEygO2imM60qXgY9K4D5EsJTliMAYXX16YhUTnkMnyp2HKo
	eJVCVK6uCavUtNTooiSQ/RkITt1nWHQnjYwC/RM5jthKZo0WVFylvYcLWHAKh2bjhWZVQXvt5+Q
	8h0tE
X-Received: by 2002:a05:701b:4587:b0:1b2:6844:25c9 with SMTP id a92af1059eb24-1b5030613dbmr6429373c88.3.1794709263990;
        Sat, 14 Nov 2026 18:21:03 -0800 (PST)
Received: from kdev ([131.179.133.114])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d8f5sm30318498c88.3.2026.11.14.18.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 18:21:03 -0800 (PST)
From: Niloy Meharchandani <niloymeharchandani@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Niloy Meharchandani <niloymeharchandani@gmail.com>
Subject: [PATCH] hwmon: (pmbus/xdp710) Use dev_err_probe()
Date: Sat, 14 Nov 2026 18:20:53 -0800
Message-ID: <20261115022053.32321-1-niloymeharchandani@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Use dev_err_probe() in xdp710_probe() instead of dev_err() followed by
returning the error. This simplifies the error paths and prints the error
code in symbolic form.

No functional change intended. Compile-tested only.

Signed-off-by: Niloy Meharchandani <niloymeharchandani@gmail.com>
---
 drivers/hwmon/pmbus/xdp710.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/hwmon/pmbus/xdp710.c b/drivers/hwmon/pmbus/xdp710.c
index 494dbe45ebc6..34c6cefbfc13 100644
--- a/drivers/hwmon/pmbus/xdp710.c
+++ b/drivers/hwmon/pmbus/xdp710.c
@@ -71,24 +71,18 @@ static int xdp710_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ret = i2c_smbus_read_word_data(client, XDP710_CS_RNG);
-	if (ret < 0) {
-		dev_err(&client->dev, "Can't get CS_RNG");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret, "Can't get CS_RNG\n");
 	cs_rng = (ret >> 6) & GENMASK(1, 0);
 
 	ret = i2c_smbus_read_word_data(client, XDP710_V_SNS_CFG);
-	if (ret < 0) {
-		dev_err(&client->dev, "Can't get V_SNS_CFG");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret, "Can't get V_SNS_CFG\n");
 	vtlm_rng = ret & GENMASK(1, 0);
 
 	ret = i2c_smbus_read_word_data(client, XDP710_REG_CFG);
-	if (ret < 0) {
-		dev_err(&client->dev, "Can't get REG_CFG");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&client->dev, ret, "Can't get REG_CFG\n");
 	ret &= GENMASK(5, 0);
 	rsense = micro_ohm_rsense[ret];
 
-- 
2.53.0

