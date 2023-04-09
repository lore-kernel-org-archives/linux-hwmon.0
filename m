Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6125C77B61
	for <linux-hwmon@archiver.kernel.org>; Sun,  9 Apr 2023 03:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjDIDrq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 Apr 2023 23:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjDIDrp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 Apr 2023 23:47:45 -0400
Received: from ipmail03.adl2.internode.on.net (ipmail03.adl2.internode.on.net [150.101.137.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8D5D85B9F
        for <linux-hwmon@vger.kernel.org>; Sat,  8 Apr 2023 20:47:44 -0700 (PDT)
IronPort-SDR: 6432355a_Y5PEIQfZOKPJFluECEJ8JH5xWt0JQOSJguDk1FtEdn1Q96d
 D56vuHO0HAwXabj5Ntwj+0DoPNXDv3Oi07DPNzQ==
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ALAwBgNDJkjPQc8jxaHQEBAQEJARIBBQUBSYFGgi6CT?=
 =?us-ascii?q?5V/n14PAQ8BAUQEAQGFBgKFPSY4EwECBAEBAQEDAgMBAQEBAQEDAQEGAQEBA?=
 =?us-ascii?q?QEBBgQUAQEBAUBFhWgNhgQCAQMnCwENAQE3AQ8ZOFcGARKCfoJdrHMzgQGCC?=
 =?us-ascii?q?AEBBoJimmqBXgmBQYt0gRaDNnpCP4FOgRWBPIE+bosGmi8KgTRxBYEgDkpzg?=
 =?us-ascii?q?QQCCQIRa4EQCGeBeUACDWQLDm+BSoFOgVwEAhRkAwkDBwVJQAMLGA0WOhMsN?=
 =?us-ascii?q?RQgXmwtEhIFAwsVKkcECDgGHDQRAggPEg8sRA5CNzMTBlwBKQsOEQNOQRlsB?=
 =?us-ascii?q?IIHCgYBJiSdbnJZATQwggeiEqIXhAeBWZ8UTYFGp3yXcyCiEi1rhCwCCgcWg?=
 =?us-ascii?q?XqBfk0fGYMiTwMZD44gDA0JFYF1kVFjPQIHCwEBAwmLRQEB?=
IronPort-PHdr: A9a23:3Zyg0xch37C+Ipdq8U6nssiTlGM/hYqcDmcuAtIPgbNSaeKo5Z39M
 kvF6bNgiUKPXImd4u8Xw+PMuPXmXmoNqY2ErGhEapFJUAMIzMQOygIsDJTXVkTyIKzmM3NqT
 p0QBlRvpinpOkMNR67D
IronPort-Data: A9a23:/+njZaCVXXVvOhVW/zznw5YqxClBgxIJ4kV8jS/XYbTApGxz0TMAz
 DcdXm6GPP6KamegL9wiaduw805VvsTUy9ZhHlFoqCszQy9ApcSdXdrAfxqvZH7KcceaEktqt
 slGZoHpIZFvRBcwhD/0YuC79yUUOYJk51bYILSZUsykbVY8EE/NsTo6x6hjxNQAbeGRW2ulo
 cn1r9DUJGir0jt1NnN8w6+YoXuDhtyr0N8llgVWic5j7Ae2e0Y9VPrzFYnpR1PkT49dGPKNR
 uqr5NlVKUuEl/uFIorNfofTKiXmcJaLVeS9oiY+t5yZv/R3jndaPpDXlRYrQRw/Zz2hx7idw
 TjW3HC6YV9B0qbkwIzxX/TEes1zFfUuxVPJHZSwmfKd61WWInHe/+tRERFreqwVx8QmWUgbo
 JT0KBhVBvyCr+i33Kn9QfNlmcokNsWtMYYC/HBsizjEZRokac6bBf+Wv5kCjHFq2pwm8fX2P
 qL1bRJhdh3GYDVEIF4IBpUkkKGlg2S5cjEeoU/9Sa8fuTiDlVQggem1WDbTUobUef14wgGAn
 Evb3nbCLkglJN2byBPQpxpAgceUxXirAthDfFGizdZugVuO1ikTFxgRU3OlrvSjzE2zQdRSL
 woT4CVGhawz8lG7ZsP6Uha75WOf+BgRR7J4EeE37B+E0Kf8+BuCCy4PSTspVTA9nJFuAGZ2j
 BrTz5azWWApq6GcVXOWsKuMojL0Mi8Qa2YfDcMZcecby+fthJlj3xj9cshcDf7oyfz4JBOhm
 xnf+UDSmI4vpcIM0qy6+3XOjDStuoXFQ2YJCuP/ADnNAuRROdHNWmC41bTIxbMbd9bGFwXpU
 GwswpXHtrhWU/lhgQTXGI0w8KeVC+GtGQC0bbRHJIgt8Tm8k5JIVdoIuGkWyKtBFMsbMQTuf
 VPT8TxY4JJIVEZGgIcpO8frV55vl/ilT4i5EOvIZ8ZPad5tbACGuippYAiZwggBcXTAc4ljZ
 /93ku72Vh727JiLKxLvGo8gPUcDnHxW+I8qbcmTI+6b+bSffmWJbrwOLUGDaOs0hIvd/lWNo
 okPaZHUk0QDOAEbXsUx2dBIRbztBSVkba0aV+QNL4Zv3yI8RztwV6+BqV/fU901x/g9ehj0E
 oGVARcDmACl1BUr2C2Wcn8rabXzUIx5oG5TAMDfFQjA5pTXWq72tP13SnfCVeV/nACV5aItE
 aVtlgTpKqgndwkrDBxENsSt8dQ+LEr37e9MVgL8CAUCk1dbb1Sh0rfZksHHrUHi1wLm7Jdsk
 K7qzQ7BX5sISiJrCcucOrrlzEq8sTJZ0Kh+VlfBaIsbMkj90plYGwqohN8OIuYINUriwBme3
 F2oGhs2n7TGjLI019jrvpq6ibmVPdFwJWdgJFmD342KbXHb2kGB3b5/VP25eGGBdWHsp4SnS
 +Zn79D9F/wlnl1PndFOFud6/4lj49HfmqJT8T15LUX2bnCAKLBpEl+Z1+Zh64xPwb54v1Ote
 0Sto9N1B5SACPnHInUwejU3S/ul7u4FvDv44dAeAlTI1AUu8JWpCUxtbgSx0gpDJ75LAaYZ6
 OYGuv9OzTegixAvY+20vgoN+0uidnU/Arga7LcEC4rWiy0u+FFIQbrYLgTUuJivSdF9AnMGE
 w+uppjppupjnxLZUn8JC3Ly8/JXhs0OtDB03VYyHQm1teSftMAn/i960GoRflxOwwRlwtBDH
 DFhF3dIKJWk+xZqg8l+XF6QJTxROS3BxGvPzwomqW6IaWipSW3HE0MlM8mv4k0y0jxRbxpbz
 p6i2UfnVjfbJ+Px0nEAR0VgkuHRcoUo0gjGm+SiMZ2kHoY7UxXhkKSBdWoFkDq5IMIT1Wnsh
 /hmw/Z0UoL/bRUvmqwcD5KI8JgtUzWGFXNyeu5g96Y3Am3sQjG+9jyQIUSXeMkWBfj13WKnK
 s5pfORjag+f0XuQkzUlGqI8Gb94s/o37t4keLmwB2onsaOanwV5oqDr6Snyq286cepAyf9nB
 NvqSAuDNWiMiV9/uWzH9pBEM1XlR+g0XlT32eTt/dgZE54GjvpXTngz9bmK7lG1Kwps+iyGs
 DzTP5H2y/NQ8qUyvo/OPJgaOSCKB4LSbtmYyCGyrNVEUv3XO+jsqQ4+iwfqLiZWD5QrSvV1k
 rW8tdqv11KYvr0zfTvrnsiQJYIU4c+CYfdeDfvqHUlnnA+peszl0z0c8U+WdL1Ll9J84JG8Z
 g2aMcGfS/8ca+1/9lZ0NRdMNgk7MLvmSKXKqQeWjeW+OjJE3SPpdNqYpGLUN0dFfSo2CrjCI
 w7Tucf2wOtHrY5JVSQ2N9s/D7BWeFbcCLYbLfvvvjylD06tsFOImp3msTECsTjrKH21IPzW0
 KL/ZCrVVUqN4fnT7dRjrYZNkAUdDy99jckOb0stwYNKpA7gPlEWD9Y2EMsgOshYnBWngdu8L
 HvIYXA5ACrwYSVcfF+uqJ7/VwOYHaoVNs2/OjUt+FiOZjyrAJ+bRoFs7Tpk/2w8bw6LIDtL8
 j3C0iaY0sCN/6xU
IronPort-HdrOrdr: A9a23:5N3EEq1xRGMw5i6f308zOAqjBGgkLtp133Aq2lEZdPU0SKalfg
 6V/cjzsiWE8Qr4Ohkb9OxoXZPtfZqyz+8X3WB8B9iftUzdyQ+VxeJZnO3fKkPbak/DH4dmvM
 8KT0E9MqyWMbEQt6bHCWeDferJT7S8gdiVbJ/lvhJQpBlRGt1dBhlCe3um+5JNNXJ77UtQLu
 vn2vZ6
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl2.internode.on.net with ESMTP; 09 Apr 2023 13:17:39 +0930
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 3393lL5C3520033
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 9 Apr 2023 13:47:34 +1000
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 3393lL5C3520033
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1681012054; bh=u/SN4T83qNNge3QACz3dYWYjV06xm1cJp9myo0WsKp8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R4TeQoNKj+X74azUFRgZrCvtCFJIJTSeGkDRxAKXTWYa5aLdTYndjr589zwkYlGtp
         q9czDLDz5cR7xFKGCin8uJFXbYozw7TWLXPr4XTxoZY+2/630UEN8pVZDwbzno4ifQ
         ATIXs8Kz4sxRsYaWqMX7CJtN5i3uM70GpyXY2ABC9NPY1hxCblWXIXC2fnQIVQpUOp
         Y103yb1qtrpLjkdrcBxEWz6BK7NCpqa+z0lx0f3JjfsdkumKSFpNqJ507CgEVcAyyD
         TNm++KuoOs9RRJjIVpdCYVPS9NZ5Wg+G/6lAdY3F3AInOrocoLjY+VwI2SxnU1BcEm
         OANg2sAfwpw7Q==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 1/4] hwmon: (it87) Disable SMBus access for environmental controller registers.
Date:   Sun,  9 Apr 2023 13:47:15 +1000
Message-Id: <20230409034718.1938695-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230409034718.1938695-1-frank@crawford.emu.id.au>
References: <20230409034718.1938695-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 09 Apr 2023 13:47:34 +1000 (AEST)
X-Virus-Scanned: clamav-milter 0.103.8 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add functions to disable and re-enable access by the SMBus for specific
chips.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 58 ++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index f774a0732a7c..b74dd861f0fe 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -162,8 +162,11 @@ static inline void superio_exit(int ioreg, bool noexit)
 #define IT8623E_DEVID 0x8623
 #define IT8628E_DEVID 0x8628
 #define IT87952E_DEVID 0x8695
-#define IT87_ACT_REG  0x30
-#define IT87_BASE_REG 0x60
+
+/* Logical device 4 (Environmental Monitor) registers */
+#define IT87_ACT_REG	0x30
+#define IT87_BASE_REG	0x60
+#define IT87_SPECIAL_CFG_REG	0xf3	/* special configuration register */
 
 /* Logical device 7 registers (IT8712F and later) */
 #define IT87_SIO_GPIO1_REG	0x25
@@ -284,6 +287,8 @@ struct it87_devices {
 	u32 features;
 	u8 peci_mask;
 	u8 old_peci_mask;
+	u8 smbus_bitmap;	/* SMBus enable bits in extra config register */
+	u8 ec_special_config;
 };
 
 #define FEAT_12MV_ADC		BIT(0)
@@ -533,6 +538,8 @@ struct it87_sio_data {
 	u8 skip_fan;
 	u8 skip_pwm;
 	u8 skip_temp;
+	u8 smbus_bitmap;
+	u8 ec_special_config;
 };
 
 /*
@@ -547,6 +554,9 @@ struct it87_data {
 	u8 peci_mask;
 	u8 old_peci_mask;
 
+	u8 smbus_bitmap;	/* !=0 if SMBus needs to be disabled */
+	u8 ec_special_config;	/* EC special config register restore value */
+
 	unsigned short addr;
 	const char *name;
 	struct mutex update_lock;
@@ -701,6 +711,39 @@ static const unsigned int pwm_freq[8] = {
 	750000,
 };
 
+static int smbus_disable(struct it87_data *data)
+{
+	int err;
+
+	if (data->smbus_bitmap) {
+		err = superio_enter(data->sioaddr);
+		if (err)
+			return err;
+		superio_select(data->sioaddr, PME);
+		superio_outb(data->sioaddr, IT87_SPECIAL_CFG_REG,
+			     data->ec_special_config & ~data->smbus_bitmap);
+		superio_exit(data->sioaddr, has_conf_noexit(data));
+	}
+	return 0;
+}
+
+static int smbus_enable(struct it87_data *data)
+{
+	int err;
+
+	if (data->smbus_bitmap) {
+		err = superio_enter(data->sioaddr);
+		if (err)
+			return err;
+
+		superio_select(data->sioaddr, PME);
+		superio_outb(data->sioaddr, IT87_SPECIAL_CFG_REG,
+			     data->ec_special_config);
+		superio_exit(data->sioaddr, has_conf_noexit(data));
+	}
+	return 0;
+}
+
 /*
  * Must be called with data->update_lock held, except during initialization.
  * We ignore the IT87 BUSY flag at this moment - it could lead to deadlocks,
@@ -2859,6 +2902,15 @@ static int __init it87_find(int sioaddr, unsigned short *address,
 	if (dmi_data)
 		sio_data->skip_pwm |= dmi_data->skip_pwm;
 
+	if (config->smbus_bitmap) {
+		u8 reg;
+
+		superio_select(sioaddr, PME);
+		reg = superio_inb(sioaddr, IT87_SPECIAL_CFG_REG);
+		sio_data->ec_special_config = reg;
+		sio_data->smbus_bitmap = reg & config->smbus_bitmap;
+	}
+
 exit:
 	superio_exit(sioaddr, config ? has_conf_noexit(config) : false);
 	return err;
@@ -3094,6 +3146,8 @@ static int it87_probe(struct platform_device *pdev)
 	data->addr = res->start;
 	data->sioaddr = sio_data->sioaddr;
 	data->type = sio_data->type;
+	data->smbus_bitmap = sio_data->smbus_bitmap;
+	data->ec_special_config = sio_data->ec_special_config;
 	data->features = it87_devices[sio_data->type].features;
 	data->peci_mask = it87_devices[sio_data->type].peci_mask;
 	data->old_peci_mask = it87_devices[sio_data->type].old_peci_mask;
-- 
2.39.2

