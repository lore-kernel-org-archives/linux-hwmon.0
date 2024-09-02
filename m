Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBF9185B50
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Sep 2024 07:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263731; cv=none; b=mYHnFWLWjsyXL2tCBlBhccQSBwiY48AFJ0dU4Oa6L6LmdCkuYsRH+pmrjJ2UrSsnwimZaJXJXs9a85LE0QbRSD6zrsMJ2SxjEBwn11mnFyUoyF0RPFQqrmsNSDSQ5kuTDfZjApWiQ+Vz2zewZ+c6u7B/qj5qLvdx5jWVULqmyBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263731; c=relaxed/simple;
	bh=g88+rV3OZb7bY790ZHs+bSaBQ0kK1PuDYLwRhNwjZJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QRet5zghqDBpE6QRtptsTLJrRKpPShcC/4DLp0Blkdvf9Hz9PIQj93+I8rXSsR0P3TDc+Aci9tM9iZCxiTjGRuFzINUGmqb/2rrs5iyFMLeSYZ8m/Ic9vfoLoGR2rBok4VkNNh3WLowin6jU4M9u0S46p2Nmp31BgD7d2VqEUNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=NlhKgbJ/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="NlhKgbJ/"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c210e23573so3955567a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Sep 2024 00:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1725263728; x=1725868528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qb7ceK/B/OV9H1eLIURr+7V31ikoGciE1WKE/XMoutk=;
        b=NlhKgbJ/9ib/uNv2Nj8WQfR3f+Ae8Y6ZUhmTTQYQacC2Awg4xh6AvzIz6kfWVRfkoX
         MVbKfkSTAMoi3FkhW1kEJU2fGPwLHPe5KU+admNcnnqebk+7GgFhNCEYhS98o+Y8j8oz
         HV1SNXyV8WYF4G4pFSWJWFt8HUR3d1dHtEXSdBt5uFtHWdeg3hiv+2WB0KOvDq9QHYw3
         bpdqt+iAsC2/GKNn4PcYhBiEZg53vRhD2MvG34xCg0qYrf995bspvkyR8xMGVGHtaQYw
         +i7QwT4hpOcTfcycAVks8qzWhLP4FMfl5FPrKAvxs/WhyzmD1bOxF6LukbI8qlS2uihA
         MGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263728; x=1725868528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qb7ceK/B/OV9H1eLIURr+7V31ikoGciE1WKE/XMoutk=;
        b=lXOnDw+bJCDKxHGDtcsaTbdyzUGufRihf6N6Zi7YVjYyED5ZM6S4eB6TYn0RhrMey0
         7OFlFJWaH7eBEbgasDwJiIpn76G/fYoZADpjqm3fw4CBNeciZRd+oV3IEypKwVmhTKa1
         ZqZaAPdQ0Bp83+zhm1UsS6780XvHo/7uDAZJiFlWzuDpkRYIu6nCzh0PkMvqsj1WGJAp
         QODdggCBt4l0xuWs/Ph408ojicJhF+ak3FpSMLsIQqX9e7vy4NeWW5yvsl137ycXwFFT
         cuXjqJG9hnrjMdihlOFVirwG8Z5dAEaVuSym2tkjiTsceE37N3LpDutuOuaeQcCyYnjt
         k/Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWWbpopurDtyMa2P/TL3KHax3DheZdO0w9nbcs++doU1neAVcxrAxLIXB9KiQPDRT2ghVs6rDxlXIlOHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCbUWmdG4zvIOlMxjdKYXo8zSypt+wtv0mgWCM7USs2obkgStk
	gZ4PJTPXDMGkgpMTLQGcRaGZh6pl6Jsgt5FjeU9RqummSFvfvlXFXnv4BUdF+ok=
X-Google-Smtp-Source: AGHT+IHbIDyamXFnvl4gbct9/HlR5EYVuSaL7iRyKN6FCDoR3OKvvmjNyU60C3hFefxqL4LEPSCUPg==
X-Received: by 2002:a17:906:f5a2:b0:a86:6a2b:3e57 with SMTP id a640c23a62f3a-a897f8e73b0mr1181403866b.29.1725263728339;
        Mon, 02 Sep 2024 00:55:28 -0700 (PDT)
Received: from fedora.sec.9e.network (ip-037-049-067-221.um09.pools.vodafone-ip.de. [37.49.67.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989022481sm521076066b.86.2024.09.02.00.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:55:28 -0700 (PDT)
From: Patrick Rudolph <patrick.rudolph@9elements.com>
To: linux-kernel@vger.kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3 5/5] hwmon: pmbus: pli12096bc: Add write delay
Date: Mon,  2 Sep 2024 09:53:16 +0200
Message-ID: <20240902075319.585656-5-patrick.rudolph@9elements.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240902075319.585656-1-patrick.rudolph@9elements.com>
References: <20240902075319.585656-1-patrick.rudolph@9elements.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tests on PLI12096bc showed that sometimes a small delay is necessary
after a write operation before a new operation can be processed.
If not respected the device will probably NACK the data phase of
the SMBus transaction. Tests showed that the probability to observe
transaction errors can be raised by either reading sensor data or
toggling the regulator enable.

Further tests showed that 250 microseconds, as used previously for
the CLEAR_FAULTS workaround, is sufficient.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
---
Changelog v2:
- No change

Changelog v3:
- Added changelog

 drivers/hwmon/pmbus/pli1209bc.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/hwmon/pmbus/pli1209bc.c b/drivers/hwmon/pmbus/pli1209bc.c
index 2c6c9ec2a652..178e0cdb7887 100644
--- a/drivers/hwmon/pmbus/pli1209bc.c
+++ b/drivers/hwmon/pmbus/pli1209bc.c
@@ -54,30 +54,6 @@ static int pli1209bc_read_word_data(struct i2c_client *client, int page,
 	}
 }
 
-static int pli1209bc_write_byte(struct i2c_client *client, int page, u8 reg)
-{
-	int ret;
-
-	switch (reg) {
-	case PMBUS_CLEAR_FAULTS:
-		ret = pmbus_write_byte(client, page, reg);
-		/*
-		 * PLI1209 takes 230 usec to execute the CLEAR_FAULTS command.
-		 * During that time it's busy and NACKs all requests on the
-		 * SMBUS interface. It also NACKs reads on PMBUS_STATUS_BYTE
-		 * making it impossible to poll the BUSY flag.
-		 *
-		 * Just wait for not BUSY unconditionally.
-		 */
-		usleep_range(250, 300);
-		break;
-	default:
-		ret = -ENODATA;
-		break;
-	}
-	return ret;
-}
-
 #if IS_ENABLED(CONFIG_SENSORS_PLI1209BC_REGULATOR)
 static const struct regulator_desc pli1209bc_reg_desc = {
 	.name = "vout2",
@@ -127,7 +103,7 @@ static struct pmbus_driver_info pli1209bc_info = {
 	    | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP
 	    | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_STATUS_INPUT,
 	.read_word_data = pli1209bc_read_word_data,
-	.write_byte = pli1209bc_write_byte,
+	.write_delay = 250,
 #if IS_ENABLED(CONFIG_SENSORS_PLI1209BC_REGULATOR)
 	.num_regulators = 1,
 	.reg_desc = &pli1209bc_reg_desc,
-- 
2.45.2

