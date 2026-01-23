Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C475275B03
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 18:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192541; cv=none; b=dvEhURHCcyOrX+xv0vwgpS61j29JEuQZvmQHGKrvEYp95WfM4Xv72TChXhiadXuKg5iCTnin50YSQTtUpx3Br+/mhHnnoMnnRUHzL8rO5A/U5r2S1DXSYgwx5PiKxdwraVwEo7JQDmbgzzvpfNvuFByNjKcfk8AQAoScGkA0OsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192541; c=relaxed/simple;
	bh=SIVuQucr0XUIbRjwS0Nu80xS1m3kZ3OXWbHv6X+sf9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXRYsyzVDouhGf0KZ5KrviW2UipmR7tG1UIuzOFE5ieaY6ofvdaPVl0E8eVVhOcDPYWZb1qIKXi09M8XRvzQR1pCDcvKw+sK3brShu9DPw5I/9WlGilM8Yg2ZbmbRTlEbjpWnmb6rmOCTatDG02OKuRMh2CYY0GqwEbQxEVJFMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Im4JyzYT; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Im4JyzYT"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f47610542so1387187b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 10:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192539; x=1769797339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AKM++0ITaCmDLPaI1GObBl9/EOl/aYbw0SPRuuisulc=;
        b=Im4JyzYTdISApslmzIeaKSzYVrb0P1/35xRULrzILzBqYy7L7EvTujaL7fi516pAhi
         JgCqaL104H+KYc8nyo1P677feR+xFmDjUOgxkQDuk74hU9MuY6lotKm5CvX3+lagu8MF
         Vo09dsyAwqapItulJmSgceQ8smvCOjfns2RyesQ0EUeQhP7S1KovfuuJk0pFWdF4ojOg
         DQY2A1AzJxv7uONcFdCyq+y1oagiQPSlynXr/9jCOvhYUZeAY7hGQM8gAbjaxaUwm4zN
         BRePxFztkta+gk98qBRUo6qgIP3PIopa4LktS2gaaKb45cX7SBQxwWMEYWWd6cTA9eRt
         0wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192539; x=1769797339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AKM++0ITaCmDLPaI1GObBl9/EOl/aYbw0SPRuuisulc=;
        b=WDd9dSTO3yZwBD4e7xq+Eyii7MrcY1WNcKB7UMZvCg81JNg1e+3S4ovzgfGbhuFUIl
         JziAM8/mbPpAJmd0S+QIFZODu1R7Fieiv2SWqcujj7rnz56MOjhtRypOThzSZZKyNGR7
         SaqfwYqxWXm2oLiYPyRiJ4++rLMN4yBzdLQ4PqrQpJvS35jgrC4L1+Z3ER1COjH0Iij1
         5oc/9b1KIY8nO9Qj987tP2pi5hqAn12syjz4ypfloU1DfSKqR0YOPB8CtQ7VW1gAPl/T
         0lOPkc4LJMeHbnLXA3ygJI0LxGCB3pBf8+3YHTpgA6NHkP61YX4x0qJ4FbGDVhXyUpqP
         bQqg==
X-Gm-Message-State: AOJu0YwsjhCER/h2Fph4vyhdMopNxSq8nPHBNJWDn3fC+OgGfreAE3o4
	buUQBvFDMZ2ct0IozRDurGbJ8rosrbygfJlE89LQdFxoHUPdsuteFWNa46Bh5JmY
X-Gm-Gg: AZuq6aJ/sSc5Sy5uDWl/ah1/F51IacVJU9TXK5uayVJFCpXVxfkFSkihBXgsbHLmonH
	vYQviAPqP582ms89jhOZjVIDjWaRowAHjdtNmvTHws8lsX0yG+IAr59amJjaW8YRqI3s/Ol/1FH
	JjdmB9/AwfEMhypeBhabWX+PG/Aa5Dhoi/1guacRZkF8MRqmoVx1TcJ6CEv7dCGkOhlei2DqHJk
	7odn7b9uMpFGhKqFy6UtGQSUA7W3Tfa8Mk0N2KeNYQx2ul490nGTiEdM48jVZDQJ9ahmK/fUKJe
	2D4RN3MYWyrbQp4xGCQW/wZWAxAgbzdOivMfgnURLAZnaWD5zYrqAYB/fSVWRresH/XkVvXqhqL
	yA/Eu7I8JreOzIa06MBl55oUARm3QdjeRCUx1ohlwejtfo4gtIDiWVVa32K3ZskWUSHQJV7M2Cb
	ITmdsV07xvz5nVAG5gpiZIjetAsAh5UyC8C4c=
X-Received: by 2002:a05:6a00:1c9c:b0:819:5db9:6ac0 with SMTP id d2e1a72fcca58-823216f72a9mr1820886b3a.37.1769192539277;
        Fri, 23 Jan 2026 10:22:19 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318663d82sm2792223b3a.21.2026.01.23.10.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:22:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	lihuisong <lihuisong@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH RFT 3/5] hwmon: Add support for updating thermal zones
Date: Fri, 23 Jan 2026 10:22:06 -0800
Message-ID: <20260123182208.2229670-4-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260123182208.2229670-1-linux@roeck-us.net>
References: <20260123182208.2229670-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement support for updating thermal zones. This is necessary
to be able to handle updates to sysfs attribute visibility.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 1f35285ca7a0..cb89218a0b6a 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -276,7 +276,7 @@ static struct hwmon_thermal_data *hwmon_thermal_find_tz(struct device *dev, int
 	return NULL;
 }
 
-static int hwmon_thermal_register_sensors(struct device *dev)
+static int hwmon_thermal_handle_sensors(struct device *dev, bool update)
 {
 	struct hwmon_device *hwdev = to_hwmon_device(dev);
 	const struct hwmon_chip_info *chip = hwdev->chip;
@@ -294,22 +294,42 @@ static int hwmon_thermal_register_sensors(struct device *dev)
 			continue;
 
 		for (j = 0; info[i]->config[j]; j++) {
+			umode_t mode;
 			int err;
 
-			if (!(info[i]->config[j] & HWMON_T_INPUT) ||
-			    !hwmon_is_visible(chip->ops, drvdata, hwmon_temp,
-					      hwmon_temp_input, j))
+			if (!(info[i]->config[j] & HWMON_T_INPUT))
 				continue;
+			mode = hwmon_is_visible(chip->ops, drvdata, hwmon_temp,
+						hwmon_temp_input, j);
+			if (!mode) {
+				struct hwmon_thermal_data *tzdata;
 
-			err = hwmon_thermal_add_sensor(dev, j);
-			if (err)
-				return err;
+				if (!update)
+					continue;
+				tzdata = hwmon_thermal_find_tz(dev, j);
+				if (tzdata) {
+					devm_thermal_of_zone_unregister(dev, tzdata->tzd);
+					devm_release_action(dev, hwmon_thermal_remove_sensor,
+							    &tzdata->node);
+				}
+			} else {
+				if (!update || !hwmon_thermal_find_tz(dev, j)) {
+					err = hwmon_thermal_add_sensor(dev, j);
+					if (err)
+						return err;
+				}
+			}
 		}
 	}
 
 	return 0;
 }
 
+static int hwmon_thermal_register_sensors(struct device *dev)
+{
+	return hwmon_thermal_handle_sensors(dev, false);
+}
+
 static void hwmon_thermal_notify(struct device *dev, int index)
 {
 	struct hwmon_thermal_data *tzdata = hwmon_thermal_find_tz(dev, index);
-- 
2.45.2

