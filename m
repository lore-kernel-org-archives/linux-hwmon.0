Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4612E4949E1
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778690715; cv=none; b=prv9ZkFG2bYyNCEJFZA17cs9STHQWgtuWr9+0WOo6c7UBWyCgyZfS3BOkcwm0zNCirTsd5xeoDt5XjVWqG6CuwHEPSozBoIKo+4zBI9EXGu1EwYoNxeK9OZDCwKp90MM9fxVeHSbUVI19eXxyyL8c9jYAcFDuTnkDCj1glxEgOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778690715; c=relaxed/simple;
	bh=rXjZn3imjV4d0sWzAc5EwA0C+in9T5UPvs46nYpbOnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lD606B3BwEOsQjfR+a53njRebrvQ7hhrh9f5ZGVFcv32siMWzew9xe2r/QMuvEu+9IFn+JpxdT0QanxdslEPfZ82FLQvLh4RbQGsBYcuiWU7gQ4lNO7pwimJmP1T9EnaYIuiDsx9uUgxi/YzL14R9uC+zM/TgE/QqshA8zqHp+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=s0E5YvBq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="s0E5YvBq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso44369935e9.3
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 09:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778690711; x=1779295511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ezVOCwbzx05T50oaVMb0pg561EUcKl7puUvKV/7af1Y=;
        b=s0E5YvBqGzCyMrpE5rDLCt2PVeoocWzjUZOhJFLT3ZA3Y4epdoNSqf87hUBRk3rkYU
         EVeSFgXigmWbONFlBoTppu5vOg6AXsd111Umw5YvaVn7HcUIzXWDJ3nlWimb4kjUeAeg
         amP55FMyaFnUAHnMXsLwvX9D2omjrSSsgo0eeJwtq2fWN5hMMAMtvLW9v23ljA3aAHxV
         KdOMD05unCvWmaCt17wm/v35Z9ZXOqAuBtmmNOocKh3paFCQtuOzndlQmpNx16ULXx/Z
         tZL+3gP1nq7Cphl2FTBJrWD6WHenmj0QIasTM4B88LwgWb0mIHtqKj06N0nh5KAeoY+y
         Du5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778690711; x=1779295511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezVOCwbzx05T50oaVMb0pg561EUcKl7puUvKV/7af1Y=;
        b=ZJ9iHMiXflaDnz5INZJdrlLBp5URSwGeJ6/MjOR6YpjT+QrdgSH9y4GRVeY2GVaq4M
         /oOxQJ29Eb+wq252yS9xBPDEw4iwGmb2VocdMd0LDb1wjRbDve1ogpCju6+2bpQ8yWai
         sR/30ZMBWqVGs95SaHOmniUlQPEKal/Vlc+46TbKZCeoEvG/mqFibu2sBCIXaV+2jNjd
         ArTkEtTZ06/ESTrANY+cNHxBCZdQN5/29+kR1vQ32G0oJgHo/6oRmZqVKOv7R/XLuz3U
         9QTc7ys6n58Z0kJtC+1bY0Y3ivEUZiKAWglhSIhQ7XGhBbHWByyaZqu1b6Mx5OARoWjD
         n8Gw==
X-Forwarded-Encrypted: i=1; AFNElJ/LyQUoW3yBDe9M9/rx5c747qB6EMYo/rgAcrq7e69HLbBCMZrPdC9CFCMRTas7LpU+NA4aomGaTevEvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEbAOXyTw6K3vFrHh56keCaXTDNULr4ea/365FsSMIjrF0MFZv
	pOj3Hugkv3M6XPS9o7kCCGqRTtGLAGbO/HMQ2qOLlGLej5EWlqjgaOr2DIfni9LN2ZQ=
X-Gm-Gg: Acq92OGZDJJNA5bxqJqRHwwWgsB+UR0i2klxCBJswKxc6Uo9J+sHm4Q4/iTQOtQsKgd
	YaocYMuc+LRq0cDYoQdbiJS7jVokP/t/jelQwmmDaRKMzMWXbGF6H1W2adTKr3ZLXwqOSwQlG4E
	AzBmStg3eXJjynn+1mWePTzj2BEOSi7pLnrUVHouquDoLsyXdomOA8DNwylMm4H2Kc4yyx4nqeO
	kwy3f3K38d5UUvjTDHhkQzaP6R88j1sM13ZuhfZWrFNjL5diJNRsYK+3Z0slTeJnN4rxOufj2ZE
	X4qT4cwZfGqRgtpK2Kd4F6nv4DRuWyXx/x3cG2/77BPba1W1wWb/2JvByieg2s5xREdoO/H+TxB
	qHLGBo1GnMuWe4scNEp6+TlF+aNv83b6A9TIDeBhbcOhuOcADtH9IJIieH3Y/bgKbb8oFtTBJOo
	A3R8ObSYANPEJBFskM5hNgMsuvGeSJj7CIUn5/r7vx0d904CL/CXEtiYHKAlpKjrzg4WaX6HvuP
	FA4BuB1gf2jSpo=
X-Received: by 2002:a05:600c:848c:b0:489:e696:8362 with SMTP id 5b1f17b1804b1-48fc9a30a6amr60463905e9.13.1778690710608;
        Wed, 13 May 2026 09:45:10 -0700 (PDT)
Received: from localhost (p200300f65f47db04379dbd4376e53036.dip0.t-ipconnect.de. [2003:f6:5f47:db04:379d:bd43:76e5:3036])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fd627569bsm5293725e9.1.2026.05.13.09.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:45:09 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	Igor Reznichenko <igor@reznichenko.net>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	George Joseph <george.joseph@fairview5.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Juerg Haefliger <juergh@proton.me>,
	Steve Glendinning <steve.glendinning@shawell.net>,
	Riku Voipio <riku.voipio@iki.fi>,
	Andre Werner <andre.werner@systec-electronic.com>,
	Andrei Lalaev <andrey.lalaev@gmail.com>,
	=?utf-8?q?Carsten_Spie=C3=9F?= <mail@carsten-spiess.de>,
	Guillaume Ligneul <guillaume.ligneul@gmail.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Zev Weiss <zev@bewilderbeest.net>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Robert Marko <robert.marko@sartura.hr>,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>,
	Leo Yang <leo.yang.sy0@gmail.com>,
	Daniel Nilsson <daniel.nilsson@flex.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Noah Wang <noahwang.wang@outlook.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Charles Hsu <hsu.yungteng@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Duke Du <dukedu83@gmail.com>,
	Eric Tremblay <etremblay@distech-controls.com>,
	Marc Hulsman <m.hulsman@tudelft.nl>,
	Rudolf Marek <r.marek@assembler.cz>,
	ChiShih Tsai <tomtsai764@gmail.com>,
	Andrew Davis <afd@ti.com>,
	Sanman Pradhan <psanman@juniper.net>,
	Dawei Liu <dawei.liu.jy@renesas.com>,
	Grant Peltier <grantpeltier93@gmail.com>,
	Chiang Brian <chiang.brian@inventec.com>,
	Jeff Lin <jefflin994697@gmail.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Carl Lee <carl.lee@amd.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Colin Huang <u8813345@gmail.com>,
	Torben Nielsen <t8927095@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ashish Yadav <ashish.yadav@infineon.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 0/2] hwmon: Rework initialization of i2c_device_ids
Date: Wed, 13 May 2026 18:44:56 +0200
Message-ID: <cover.1778688802.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=12770; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rXjZn3imjV4d0sWzAc5EwA0C+in9T5UPvs46nYpbOnQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqBKqIuTABM3gC9G+nGGDT87HPgQKMU7bBlNdBb VSx+P6qkQ+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagSqiAAKCRCPgPtYfRL+ TiIKCACDKvQN50GaeG5gXqfXVnIUxzbCbf1gb4QTjvW2mBG5OFpGudIoXyV5eYJ1+ccc1GPAoZ3 GSLReyri5kFI6l72vIbXFRps96QVR9Gs0h/fI1Vojy9ixt0irFImnfnb4SZECz8A5pLHE5QKvgq 7gK4qFotWByKarybvHTNvIZeS9hwtG4zlamcND7135h1rNrx+s3tWQMj/hfJWJqbcA0Vt67XrrD V2+ziK/+RSECaOAw7Y4Olh1lZ2IN8LbtiwIIpiwTpm+eLumwSGXHmVGoWhqT3f2wJfHtKYTOinu SLP9t9h/bdu7Va+DzcW+CNrzuKrRj6eY+ZFSqR3HfhLONiht
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series is a preparation for

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	index 23ff24080dfd..aebd3a5e90af 100644
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
	 
	 struct i2c_device_id {
		char name[I2C_NAME_SIZE];
	-	kernel_ulong_t driver_data;	/* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };
	 
	 /* pci_epf */

and this requires that .driver_data is assigned via a named initializer
for static data. This requirement isn't a bad one because named
initializers are also much better readable than list initializers.

There are no hwmon drivers that benefit from that change to
i2c_device_id, but it allows further cleanups like:


        diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
        index 8a082ff034dd..b2aac7348d22 100644
        --- a/drivers/iio/accel/kxcjk-1013.c
        +++ b/drivers/iio/accel/kxcjk-1013.c
	@@ -1429,7 +1429,7 @@ static int kxcjk1013_probe(struct i2c_client *client)
	 
		if (id) {
			name = id->name;
	-		data->info = (const struct kx_chipset_info *)(id->driver_data);
	+		data->info = id->driver_data_ptr;
		} else {
			name = iio_get_acpi_device_name_and_data(&client->dev, &ddata);
			data->info = ddata;
	@@ -1630,11 +1630,11 @@ static const struct dev_pm_ops kxcjk1013_pm_ops = {
	 };
	 
	 static const struct i2c_device_id kxcjk1013_id[] = {
	-	{ .name = "kxcjk1013", .driver_data = (kernel_ulong_t)&kxcjk1013_info },
	-	{ .name = "kxcj91008", .driver_data = (kernel_ulong_t)&kxcj91008_info },
	-	{ .name = "kxtj21009", .driver_data = (kernel_ulong_t)&kxtj21009_info },
	-	{ .name = "kxtf9", .driver_data = (kernel_ulong_t)&kxtf9_info },
	-	{ .name = "kx023-1025", .driver_data = (kernel_ulong_t)&kx0231025_info },
	+	{ .name = "kxcjk1013", .driver_data_ptr = &kxcjk1013_info },
	+	{ .name = "kxcj91008", .driver_data_ptr = &kxcj91008_info },
	+	{ .name = "kxtj21009", .driver_data_ptr = &kxtj21009_info },
	+	{ .name = "kxtf9", .driver_data_ptr = &kxtf9_info },
	+	{ .name = "kx023-1025", .driver_data_ptr = &kx0231025_info },
		{ }
	 };
	 MODULE_DEVICE_TABLE(i2c, kxcjk1013_id);

that are an improvement for readability (again!) and it keeps some
properties of the pointers (here: being const) without having to pay
attention for that.

My additional motivation for this effort is CHERI[1]. This is a hardware
extension that uses 128 bit pointers but unsigned long is still 64 bit.
So with CHERI you cannot store pointers in unsigned long variables.

The first patch drops a few unused assignments to .driver_data (which is
still better than assigning the values by name) and the second converts
all hwmon drivers to use named initializers.

Uwe Kleine-König (The Capable Hub) (2):
  hwmon: Drop unused i2c driver_data
  hwmon: Use named initializers for arrays of i2c_device_data

 drivers/hwmon/ad7414.c                  |  4 +-
 drivers/hwmon/ad7418.c                  |  6 +-
 drivers/hwmon/adc128d818.c              |  2 +-
 drivers/hwmon/adm1025.c                 |  4 +-
 drivers/hwmon/adm1026.c                 |  2 +-
 drivers/hwmon/adm1029.c                 |  2 +-
 drivers/hwmon/adm1031.c                 |  4 +-
 drivers/hwmon/adm1177.c                 |  4 +-
 drivers/hwmon/adm9240.c                 |  6 +-
 drivers/hwmon/ads7828.c                 |  4 +-
 drivers/hwmon/adt7410.c                 |  8 +--
 drivers/hwmon/adt7411.c                 |  2 +-
 drivers/hwmon/adt7462.c                 |  2 +-
 drivers/hwmon/adt7470.c                 |  2 +-
 drivers/hwmon/adt7475.c                 |  8 +--
 drivers/hwmon/aht10.c                   |  8 +--
 drivers/hwmon/amc6821.c                 |  2 +-
 drivers/hwmon/asb100.c                  |  2 +-
 drivers/hwmon/asc7621.c                 |  6 +-
 drivers/hwmon/atxp1.c                   |  2 +-
 drivers/hwmon/chipcap2.c                | 16 ++---
 drivers/hwmon/dme1737.c                 |  4 +-
 drivers/hwmon/ds1621.c                  | 10 +--
 drivers/hwmon/ds620.c                   |  4 +-
 drivers/hwmon/emc1403.c                 | 24 +++----
 drivers/hwmon/emc2103.c                 |  2 +-
 drivers/hwmon/emc2305.c                 |  8 +--
 drivers/hwmon/emc6w201.c                |  2 +-
 drivers/hwmon/f75375s.c                 |  6 +-
 drivers/hwmon/fschmd.c                  | 14 ++--
 drivers/hwmon/ftsteutates.c             |  2 +-
 drivers/hwmon/g760a.c                   |  2 +-
 drivers/hwmon/g762.c                    |  6 +-
 drivers/hwmon/gl518sm.c                 |  2 +-
 drivers/hwmon/gl520sm.c                 |  2 +-
 drivers/hwmon/hih6130.c                 |  2 +-
 drivers/hwmon/hs3001.c                  |  4 +-
 drivers/hwmon/htu31.c                   |  2 +-
 drivers/hwmon/ina209.c                  |  2 +-
 drivers/hwmon/ina238.c                  | 12 ++--
 drivers/hwmon/ina2xx.c                  | 16 ++---
 drivers/hwmon/ina3221.c                 |  2 +-
 drivers/hwmon/isl28022.c                |  2 +-
 drivers/hwmon/jc42.c                    |  2 +-
 drivers/hwmon/lineage-pem.c             |  4 +-
 drivers/hwmon/lm63.c                    |  6 +-
 drivers/hwmon/lm73.c                    |  2 +-
 drivers/hwmon/lm75.c                    | 62 ++++++++--------
 drivers/hwmon/lm77.c                    |  2 +-
 drivers/hwmon/lm78.c                    |  4 +-
 drivers/hwmon/lm80.c                    |  4 +-
 drivers/hwmon/lm83.c                    |  4 +-
 drivers/hwmon/lm85.c                    | 24 +++----
 drivers/hwmon/lm87.c                    |  4 +-
 drivers/hwmon/lm90.c                    | 96 ++++++++++++-------------
 drivers/hwmon/lm92.c                    |  6 +-
 drivers/hwmon/lm93.c                    |  4 +-
 drivers/hwmon/lm95234.c                 |  4 +-
 drivers/hwmon/lm95241.c                 |  4 +-
 drivers/hwmon/lm95245.c                 |  4 +-
 drivers/hwmon/ltc2945.c                 |  2 +-
 drivers/hwmon/ltc2947-i2c.c             |  4 +-
 drivers/hwmon/ltc2990.c                 |  4 +-
 drivers/hwmon/ltc2991.c                 |  4 +-
 drivers/hwmon/ltc2992.c                 |  4 +-
 drivers/hwmon/ltc4151.c                 |  2 +-
 drivers/hwmon/ltc4215.c                 |  2 +-
 drivers/hwmon/ltc4222.c                 |  2 +-
 drivers/hwmon/ltc4245.c                 |  2 +-
 drivers/hwmon/ltc4260.c                 |  2 +-
 drivers/hwmon/ltc4261.c                 |  4 +-
 drivers/hwmon/max127.c                  |  2 +-
 drivers/hwmon/max16065.c                | 12 ++--
 drivers/hwmon/max1619.c                 |  2 +-
 drivers/hwmon/max1668.c                 |  6 +-
 drivers/hwmon/max31730.c                |  2 +-
 drivers/hwmon/max31760.c                |  2 +-
 drivers/hwmon/max31790.c                |  2 +-
 drivers/hwmon/max31827.c                |  6 +-
 drivers/hwmon/max6620.c                 |  2 +-
 drivers/hwmon/max6621.c                 |  2 +-
 drivers/hwmon/max6639.c                 |  2 +-
 drivers/hwmon/max6650.c                 |  4 +-
 drivers/hwmon/max6697.c                 | 20 +++---
 drivers/hwmon/mc34vr500.c               |  4 +-
 drivers/hwmon/mcp3021.c                 |  4 +-
 drivers/hwmon/nct6775-i2c.c             | 26 +++----
 drivers/hwmon/nct7802.c                 |  2 +-
 drivers/hwmon/nct7904.c                 |  4 +-
 drivers/hwmon/pcf8591.c                 |  2 +-
 drivers/hwmon/pmbus/acbel-fsg032.c      |  4 +-
 drivers/hwmon/pmbus/adm1266.c           |  2 +-
 drivers/hwmon/pmbus/adm1275.c           | 20 +++---
 drivers/hwmon/pmbus/aps-379.c           |  4 +-
 drivers/hwmon/pmbus/bel-pfe.c           |  6 +-
 drivers/hwmon/pmbus/bpa-rs600.c         |  6 +-
 drivers/hwmon/pmbus/crps.c              |  4 +-
 drivers/hwmon/pmbus/delta-ahe50dc-fan.c |  2 +-
 drivers/hwmon/pmbus/dps920ab.c          |  4 +-
 drivers/hwmon/pmbus/fsp-3y.c            |  4 +-
 drivers/hwmon/pmbus/hac300s.c           |  4 +-
 drivers/hwmon/pmbus/ibm-cffps.c         |  8 +--
 drivers/hwmon/pmbus/ina233.c            |  4 +-
 drivers/hwmon/pmbus/inspur-ipsps.c      |  4 +-
 drivers/hwmon/pmbus/ir35221.c           |  4 +-
 drivers/hwmon/pmbus/ir36021.c           |  4 +-
 drivers/hwmon/pmbus/ir38064.c           | 10 +--
 drivers/hwmon/pmbus/irps5401.c          |  4 +-
 drivers/hwmon/pmbus/isl68137.c          | 92 ++++++++++++------------
 drivers/hwmon/pmbus/lm25066.c           | 10 +--
 drivers/hwmon/pmbus/lt3074.c            |  4 +-
 drivers/hwmon/pmbus/lt7182s.c           |  4 +-
 drivers/hwmon/pmbus/ltc2978.c           | 60 ++++++++--------
 drivers/hwmon/pmbus/ltc3815.c           |  2 +-
 drivers/hwmon/pmbus/max15301.c          |  8 +--
 drivers/hwmon/pmbus/max16064.c          |  4 +-
 drivers/hwmon/pmbus/max16601.c          | 10 +--
 drivers/hwmon/pmbus/max17616.c          |  2 +-
 drivers/hwmon/pmbus/max20730.c          | 10 +--
 drivers/hwmon/pmbus/max20751.c          |  4 +-
 drivers/hwmon/pmbus/max31785.c          |  8 +--
 drivers/hwmon/pmbus/max34440.c          | 18 ++---
 drivers/hwmon/pmbus/max8688.c           |  2 +-
 drivers/hwmon/pmbus/mp2856.c            |  6 +-
 drivers/hwmon/pmbus/mp2888.c            |  4 +-
 drivers/hwmon/pmbus/mp2891.c            |  2 +-
 drivers/hwmon/pmbus/mp2925.c            |  6 +-
 drivers/hwmon/pmbus/mp29502.c           |  4 +-
 drivers/hwmon/pmbus/mp2975.c            |  8 +--
 drivers/hwmon/pmbus/mp2993.c            |  2 +-
 drivers/hwmon/pmbus/mp5920.c            |  2 +-
 drivers/hwmon/pmbus/mp5926.c            |  4 +-
 drivers/hwmon/pmbus/mp5990.c            |  4 +-
 drivers/hwmon/pmbus/mp9941.c            |  2 +-
 drivers/hwmon/pmbus/mp9945.c            |  4 +-
 drivers/hwmon/pmbus/mpq7932.c           |  6 +-
 drivers/hwmon/pmbus/mpq8785.c           | 10 +--
 drivers/hwmon/pmbus/pim4328.c           | 18 ++---
 drivers/hwmon/pmbus/pli1209bc.c         |  4 +-
 drivers/hwmon/pmbus/pm6764tr.c          |  4 +-
 drivers/hwmon/pmbus/pmbus.c             | 60 ++++++++--------
 drivers/hwmon/pmbus/pxe1610.c           |  8 +--
 drivers/hwmon/pmbus/q54sj108a2.c        |  8 +--
 drivers/hwmon/pmbus/stef48h28.c         |  4 +-
 drivers/hwmon/pmbus/stpddc60.c          |  6 +-
 drivers/hwmon/pmbus/tda38640.c          |  4 +-
 drivers/hwmon/pmbus/tps25990.c          |  4 +-
 drivers/hwmon/pmbus/tps40422.c          |  4 +-
 drivers/hwmon/pmbus/tps53679.c          | 18 ++---
 drivers/hwmon/pmbus/tps546d24.c         |  4 +-
 drivers/hwmon/pmbus/ucd9000.c           | 16 ++---
 drivers/hwmon/pmbus/ucd9200.c           | 18 ++---
 drivers/hwmon/pmbus/xdp710.c            |  2 +-
 drivers/hwmon/pmbus/xdp720.c            |  4 +-
 drivers/hwmon/pmbus/xdpe12284.c         |  8 +--
 drivers/hwmon/pmbus/xdpe152c4.c         |  6 +-
 drivers/hwmon/pmbus/xdpe1a2g7b.c        |  6 +-
 drivers/hwmon/pmbus/zl6100.c            | 44 ++++++------
 drivers/hwmon/powr1220.c                |  4 +-
 drivers/hwmon/pt5161l.c                 |  4 +-
 drivers/hwmon/sbtsi_temp.c              |  4 +-
 drivers/hwmon/sg2042-mcu.c              |  2 +-
 drivers/hwmon/sht21.c                   |  6 +-
 drivers/hwmon/sht3x.c                   |  8 +--
 drivers/hwmon/sht4x.c                   |  4 +-
 drivers/hwmon/shtc1.c                   |  6 +-
 drivers/hwmon/smsc47m192.c              |  2 +-
 drivers/hwmon/spd5118.c                 |  2 +-
 drivers/hwmon/stts751.c                 |  2 +-
 drivers/hwmon/tc654.c                   |  6 +-
 drivers/hwmon/tc74.c                    |  4 +-
 drivers/hwmon/thmc50.c                  |  4 +-
 drivers/hwmon/tmp102.c                  |  2 +-
 drivers/hwmon/tmp103.c                  |  2 +-
 drivers/hwmon/tmp108.c                  |  8 +--
 drivers/hwmon/tmp401.c                  | 10 +--
 drivers/hwmon/tmp421.c                  | 10 +--
 drivers/hwmon/tmp464.c                  |  4 +-
 drivers/hwmon/tmp513.c                  |  4 +-
 drivers/hwmon/tsc1641.c                 |  2 +-
 drivers/hwmon/w83773g.c                 |  2 +-
 drivers/hwmon/w83781d.c                 |  8 +--
 drivers/hwmon/w83791d.c                 |  2 +-
 drivers/hwmon/w83792d.c                 |  2 +-
 drivers/hwmon/w83793.c                  |  2 +-
 drivers/hwmon/w83795.c                  |  4 +-
 drivers/hwmon/w83l785ts.c               |  2 +-
 drivers/hwmon/w83l786ng.c               |  2 +-
 188 files changed, 687 insertions(+), 687 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3

