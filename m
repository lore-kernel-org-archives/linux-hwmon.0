Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC0417CA1B
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Sep 2024 16:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726850852; cv=none; b=LYXV9GbGn8qhnJI18LKuCR4FCGFapGJrGxmtJalr77V2nDzVvNbBtuRBNlr3pDh7i3xu31TBE/z5V48Py8xP1+EvJlUPsj51toAUqW3gGSpq0mqzsL79iXqN1rSM6wEZSyBFOhi+dhbEtrnRgtWYEL5socQh7GdEKXSdX9MHbjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726850852; c=relaxed/simple;
	bh=3p8epjwY1oVoba554UVp1ZMZNkGwAgCoLLhC2PSJKOM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aWup91wKLAf8mQ8a5dAa9+CUD3+zK9lvRwFUFWkPh31/Jz2v471Xqcy+qQXqoNQcb3ylRwfmBtEWkuy5NGSbXGZPBzczwvjy+UiPW9yN9vNR8akI6Vl9ltmDskJAopWlcZpDMge54E2AcKsimFyv2NoR1GhSMF3lRIWWz/Ui1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=uL3z3rkq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="uL3z3rkq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c3400367so1900902f8f.2
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Sep 2024 09:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726850849; x=1727455649; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=auS1Nijn3/MM+vVwjmIp4Kgr8RxjQxso8G43GcLWcTA=;
        b=uL3z3rkqZcPgS5yRPjXj3VG1n5M6ku0OzbGm3pi4wJPQqx8ImhdipFi0KcRVYn3GbJ
         D/peGKRY+1cEpl+xT0jKDLDFigZEqeEQY7mMHlySv6VgOoShfe/ykrRde/pEa2L+CqSF
         OvuaaYyUM/AtE18BMvRYPNpcoH+irBRYcV7vqPGR2dhwIkEemMf3Q9FtZoQhIUJ3CLwS
         mhrHCx3AzMjg/BpdCaCMDHZZgCaU8n6DK2ALH45TpouZS0arZDgOeHEpXK9X0Eba0aNi
         yJefg594tkCt3CBf2b3wVVgqz1OwWj+AEwReUBiclcMSR2KzyU5a3OHBDrM70qMuIHqq
         fsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726850849; x=1727455649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=auS1Nijn3/MM+vVwjmIp4Kgr8RxjQxso8G43GcLWcTA=;
        b=muDOXyx5Zn/Mdl1KiBKBZyKQs5cFh0bDPyYw/pSab32Z7MwGiqCLValc+omDV41s0z
         S1DN7l11lRSWooCT5TwHdyn9mkjwEL8+jxzYtiieo1Z+iRSuOX2azISMDy7Nerr5tO5Y
         uArSV3cfy1Xv052AX9InYfI+foytg5llBPLx0yD999QhcnZVmTYBgu41oOcCgwHzyBJk
         DQeQdCyJlqQuGE/QLFQHPIe7GA2ZFJ5WVcqa5HZbXwyFpfnGYfPWocemEVY42LqwpCkf
         LYFnuK7HJ2OXQJmv0VNX+inFZMSSz5hZG08FQf6/J2M549hzkXAiYdwdcA7SfGeI16rR
         J2wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQaU7uAjoRVo1OSeq1t4ut1ejuDNcjO4yMj4Mpq2BW8I8jAebYmwWVU5LLPm7s1GX7pNFpRr0stvqYpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwC8tB588JkoYFxxqMx2jvW9c365XThrWWVR8zqdvNdW6UoUJ7w
	UoOUgAdLtY7xubYBYRpEgbC4Kqno0ZA5oVXrYzJbtOs0WPwQ7Beolt08nc2odzs=
X-Google-Smtp-Source: AGHT+IHXZIFkEVB0paBQKp6NWhbzwDh87vNSKY+P6NiQas53tTtsyxNthvn6Df+xga4/u+MbyHXoIQ==
X-Received: by 2002:a5d:4741:0:b0:374:c6b8:50b5 with SMTP id ffacd0b85a97d-37a422783aamr2678511f8f.17.1726850848643;
        Fri, 20 Sep 2024 09:47:28 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8e69:83a7:a29a:ba83])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-378e7804476sm18172250f8f.90.2024.09.20.09.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 09:47:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Sep 2024 18:47:03 +0200
Subject: [PATCH 2/5] regulator: core: remove machine init callback from
 config
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-pmbus-wp-v1-2-d679ef31c483@baylibre.com>
References: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
In-Reply-To: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1661; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=3p8epjwY1oVoba554UVp1ZMZNkGwAgCoLLhC2PSJKOM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBm7acZNBtZ0hTqllWyyFMkYkYea+7oUuVASt9st
 N3sfAwEOmyJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZu2nGQAKCRDm/A8cN/La
 hYf9D/46acuxSjA+sfoQ9+odznEGE2QZudI7LvM+JHSU/uTEuptHRL1hXmdE1Qz6bnv1WEoelb5
 7oVKFTLwZMGp7We3tD8/wedhHL5r01t52dh2tD642SNH5nXOOZgZbazATUe+vSH4DFV05/aYIhm
 HXcQ0L1e2W3/HmXhWmIkfdbly++V3pNkkSDBjbQdJ+iNN1Dh1yX0p+Qnq/ndZnoSDPauKrJmqkt
 xWpM0uObnaIsR5lEQipTJUJOpkQWwzfufyYHdQb2CBdwvSMNJs4SxjCxcBj/HdtrVw9dFG0BDvz
 oyVwKTMwhKodI638sksCw4ZCUkRkrkmJbnD5I6F0iR5yOn6J8gHoYJX2UZSlUKvAyid6VcqAfU8
 0yKY5jx2A1On/UvNFFNBw3BAzY5+dmZNO1ud3iiurAnLqETdxsaYG9B4fGm+CHaBE/q+EzY6V8H
 HG3nLSgyEh2FEfIWwqy0av3r34GXSzueXAYt9iI91E5tc23gw+Op5Mo+tXHCoaL/tdJT1NiIDkf
 90MEHG/fXhcccoStXKKIji+IFMZRxXPBOzhf6+6biaGizZ14hPFUHh7VB9eBJqptmqRzK9fjXlR
 WeK2wU+8Qio/NF2dgy/hx0xQ+5t9aUK2NMMjN2VABPjh0UQkG5ya/eGfbGGpvxVytYKDWschLnc
 dnfdIuMTDuI7igA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The machine specific regulator_init() appears to be unused.
It does not allow a lot of interactiona with the regulator framework,
since nothing from the framework is passed along (desc, config,
etc ...)

Machine specific init may also be done with the added init_cb() in
the regulator description, so remove regulator_init().

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/regulator/core.c          | 7 -------
 include/linux/regulator/machine.h | 3 +--
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 4c90ab5ad876..4666b0e226c2 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -5764,13 +5764,6 @@ regulator_register(struct device *dev,
 		resolved_early = true;
 	}
 
-	/* perform any regulator specific init */
-	if (init_data && init_data->regulator_init) {
-		ret = init_data->regulator_init(rdev->reg_data);
-		if (ret < 0)
-			goto wash;
-	}
-
 	if (config->ena_gpiod) {
 		ret = regulator_ena_gpio_request(rdev, config);
 		if (ret != 0) {
diff --git a/include/linux/regulator/machine.h b/include/linux/regulator/machine.h
index 0cd76d264727..d0d700ff337a 100644
--- a/include/linux/regulator/machine.h
+++ b/include/linux/regulator/machine.h
@@ -285,8 +285,7 @@ struct regulator_init_data {
 	int num_consumer_supplies;
 	struct regulator_consumer_supply *consumer_supplies;
 
-	/* optional regulator machine specific init */
-	int (*regulator_init)(void *driver_data);
+	/* optional regulator machine specific data */
 	void *driver_data;	/* core does not touch this */
 };
 

-- 
2.45.2

