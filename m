Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098243;
	b=rzuBAgUsxf+UdyzZPKF/ZWvl6N2kv2l47FSR/P5pPJl+Uq4Z/82AmcOtV3r+BYcMIsYv
	 YQyJtB1UeBDVPiBAmQuSK6YF7isKbAPMsXvYz2ayLS0He+tNfDl1F9bDhihrk4+QFch1s
	 PYcl+RIAzmaGcXGq9NvHSrvXXOvFIr2aswJbP2Q1KViNDYET5bA//JTH1hYd5yk5UNcLb
	 vGH1JWBXu41EvI75nzEcY3/vj+a4Y33hpjZNPXUKZ8Pj/vQkbfVx/gOXIeRjcRzqL2KEU
	 2uu+lCfKRs6e1Kv1Mck82rbRy1rGECmv/b/TUNb8WxH55XWVoJiGypM/XFxTIn5UKbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=yu3/IisoKiMdqahdFBkfxmzTUpjr39waejQqmmLzs50=;
	b=Av/iVbCySwb+pNqosQlHALhl/Nj6FB4StlH6luQKWq1UKVEAZ2hlQoP8sGo25BVsI+/3
	 yU1J9gxiSXw3n0f+foaxl+hAo8s74EUrRvQgIfZ1hWcgaOBMz071elqOrEqzBmIyO1SMt
	 01zx4duvLYe8wvI03u2Nv6q6+MLzZ/ulXRpZJWLXODSgESBwUrEfGa+uK84QOaUbwehtU
	 en2UYLdpYWhkmW64PmBvLoQ6ewEcczsXz+9bkS3GeqeiS06l2qdGO12taTZXK6EYzA6i2
	 NPp48VeoLV1d0TUEf+XD1BDxveT58ULJpt8mVGo5/s067rev2fEjblreE4HgW8Qy9Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YZk0TejA;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF7A606ADCB
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 10:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CF7A606ADCB
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YZk0TejA
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so3375018f8f.1
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Oct 2026 03:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098242; x=1793703042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yu3/IisoKiMdqahdFBkfxmzTUpjr39waejQqmmLzs50=;
        b=YZk0TejAnTs0P+KOA6rHvt/ppOoJngOLD8zd94q6da/tdzGsUPuhRhSSCaxC7bocwn
         9ku8Rgx0rTLibpWYkSTjYwSqUmx3eJ13MDUbyTbSbZdHbJVPyXba6+z5eHSxMc1C7wYR
         iau1vRE/36T4wGNhIdGc11DXzHlLbIRjf5f2vd5H2Kjtbrwh6arlgoeQZjnk+/AUMtax
         Bvhx8CNZbxN+Nw56mP4oo01TZQcLAlm3XG6jMo3R6QEUuHln61pc6XV1+vZolAhe4FGK
         MZ201uPfzJevyCfNA5F65KVadaeSSy6J8KNfDrWALfdOdzfZRBHXKXJetoLkVc2D6XrP
         NkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098242; x=1793703042;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yu3/IisoKiMdqahdFBkfxmzTUpjr39waejQqmmLzs50=;
        b=xts5CfYSyeOfZHULu8LOBt8smItg4zYAtfwcQ/ok4T2ccOl7/ubIVgVvnrTlsaVpkb
         0NkyJ8dGN5CV7CHGhL1R9XuAIGcPNTG467Mo/uoGgWBL9u/n8wI4TZJ8lJc2Co/65Eip
         6j3UQfxaRaR8A51fNYGdxm/mfSIAdsOer+GCA4COQ3z1T0bbdGKiFBuXrpeb/SE/SU3/
         wZc0PBvoeGqPjZLhBF7SvHjRd4m2JMvU9vmxZ2kElF0vE8HWycPevTIWsReanBKbFY94
         gGjnwYSVxoCpP1nSOaUSGam15FC2hyJeeC4SaXxnnYJciEHu+uVM9Tdenj8mRbYfasK4
         X04Q==
X-Forwarded-Encrypted: i=1; AKwUvByIwESqazowNehNnsN/DA3lrCQSPBpQFuSZMw3ewqmC3NluLRczIp8iActXhzQeO8dHThcYMuP118ylWw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLbOUluBh/L2eK6uaxy9K0+cKE+6f3Pp69DstSuJ+z/jsrFSAOU
	W+bAt8k+xRG/X/Ca+7xjf5Xt6hTnx4cbZopz0Z+4cYbRaoCnVTOALK530atlaj5PcH0=
X-Gm-Gg: AYBFou1uKIU9qlM4rk+Xfg9k3Yvwgq4wMJsYmU0HQrKenVkxo1UjE/PQDq0zDoJ1emG
	XeAk3hHfWLrHFj9Y5MMg9fHcW47IX+/TRXn+PHsTlKdcb65Y1hTN2uW9L6sL6RzeGScS1dEpvFy
	ju8fDdA585fo6fPBBy6OSfOqa6BDnN7eC7mAZZd5b/IqKAtm7xXM2vFIflJr1WaKF5eQbxxwVYr
	aSw6Q69EATqDucA9m2rFfLnuYaT5v2/rg0I7YTIKZC07LOy0kXPAnaUQq9tqMawQUma2fkaXqAJ
	dTgotX57YZdHeBZ3rmNotaubHfqfn1NaIdpWRij6uM+LmtygakIqr+93Y25gpBmGcIrFPFwpcyR
	pEPYKO73WG2R7t7qzURlHLaBSU+A80YWUjjZqB5MZKKuWlJmXhsEqtEvlNGIBrK/B3zpdkGKx+n
	FZkYx5RPx1uHwZBJrgm9XXSVArzYajc5GjD5Bia9QejJC3ZQHhWPx64gDzvt1qj5+Udzn3ZZyIU
	opR6ZiG94M+m5tqho6LDo5wmOkJZ+D6n9d/9e7qprVpOL3wOwsmMhyv1ttNc/CALSwfUnS2sSaR
	d9ThiMpJkvebd0Juc2VyOuo2NXOxQ3oBZSgjRykfVA0=
X-Received: by 2002:a05:6000:25fc:b0:48a:fb1c:c2a1 with SMTP id ffacd0b85a97d-48e3eb946b0mr17432153f8f.47.1793098241777;
        Tue, 27 Oct 2026 03:50:41 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc3bdbsm18106886f8f.19.2026.10.27.03.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:40 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Hans de Goede <hansg@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v4 13/23] gpio: Use named initializers for auxiliary_device_id arrays
Date: Tue, 27 Oct 2026 11:48:50 +0100
Message-ID:  <ec269df979b1e0a7df04a20eb19505c332679428.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3445; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=ipK29xnsieM2Z67q+CvAQl79lTyhNKiU3EM6eQhLh+c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IG801Xj/dsnHBArUA01/9dajOs2YXsMz0r7/ 0bdBzCqWM6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBvAAKCRCPgPtYfRL+ Th39B/wO8L/KjsTN4YYo8sIDVMQshfXCnz3w4I0wsZDrmfl0ibSrpJEKPvUoeuTjbTk5TNVcUOA 7Nj1aG55ByyZvBvw1Wnxztb0fRyeysfOrIQrpk/GoxGEWG3El0646Dv8VQYGfwjPjaP1K3UgEOm 0UnSD9538+APY2fa/H4Mrllgl6SbVOawNiE87RLGviWy95wLqsmOYQKO2B/u6eAmENFaWCxOt6w s4h5TvuHKsO+z1oiHsnhaEFplEPmeUO0p4zZWnsJpPxgmwkQf0/qLRNBwGi26Ms2PQIcdGKLdIK tY+JJUdsfqoHvvEpioYzH9wYhQPWbjYSkJ1VPcSti4MFUewc
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
auxiliary_device_id that replaces .driver_data by an anonymous union
(though none of these drivers uses .driver_data, so this patch isn't
strictly necessary for the plan, but still ok for consistency).

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-elkhartlake.c | 2 +-
 drivers/gpio/gpio-ljca.c        | 2 +-
 drivers/gpio/gpio-ltc4283.c     | 2 +-
 drivers/gpio/gpio-tc9563.c      | 2 +-
 drivers/gpio/gpio-usbio.c       | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-elkhartlake.c b/drivers/gpio/gpio-elkhartlake.c
index b96e7928b6e5..d4ddb3d00b86 100644
--- a/drivers/gpio/gpio-elkhartlake.c
+++ b/drivers/gpio/gpio-elkhartlake.c
@@ -59,7 +59,7 @@ static int ehl_gpio_probe(struct auxiliary_device *adev, const struct auxiliary_
 }
 
 static const struct auxiliary_device_id ehl_gpio_ids[] = {
-	{ EHL_PSE_IO_NAME "." EHL_PSE_GPIO_NAME },
+	{ .name = EHL_PSE_IO_NAME "." EHL_PSE_GPIO_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, ehl_gpio_ids);
diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index ad5dc9a3a119..f967feedb5d2 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -472,7 +472,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 }
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
-	{ "usb_ljca.ljca-gpio" },
+	{ .name = "usb_ljca.ljca-gpio" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
index 88aa6216006a..3295f159d83f 100644
--- a/drivers/gpio/gpio-ltc4283.c
+++ b/drivers/gpio/gpio-ltc4283.c
@@ -201,7 +201,7 @@ static int ltc4283_gpio_probe(struct auxiliary_device *adev,
 }
 
 static const struct auxiliary_device_id ltc4283_aux_id_table[] = {
-	{ "ltc4283.gpio" },
+	{ .name = "ltc4283.gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, ltc4283_aux_id_table);
diff --git a/drivers/gpio/gpio-tc9563.c b/drivers/gpio/gpio-tc9563.c
index 68c20c8cba79..5ba9df2b6936 100644
--- a/drivers/gpio/gpio-tc9563.c
+++ b/drivers/gpio/gpio-tc9563.c
@@ -80,7 +80,7 @@ static int tc9563_gpio_probe(struct auxiliary_device *adev,
 };
 
 static const struct auxiliary_device_id tc9563_gpio_ids[] = {
-	{ "pci_pwrctrl_tc9563." TC9563_GPIO_DEV_NAME },
+	{ .name = "pci_pwrctrl_tc9563." TC9563_GPIO_DEV_NAME },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(auxiliary, tc9563_gpio_ids);
diff --git a/drivers/gpio/gpio-usbio.c b/drivers/gpio/gpio-usbio.c
index e34734aa4365..fe8f51f1a4b1 100644
--- a/drivers/gpio/gpio-usbio.c
+++ b/drivers/gpio/gpio-usbio.c
@@ -230,7 +230,7 @@ static int usbio_gpio_probe(struct auxiliary_device *adev,
 }
 
 static const struct auxiliary_device_id usbio_gpio_id_table[] = {
-	{ "usbio.usbio-gpio" },
+	{ .name = "usbio.usbio-gpio" },
 	{ }
 };
 MODULE_DEVICE_TABLE(auxiliary, usbio_gpio_id_table);
-- 
2.56.0.rc1

