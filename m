Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4841F17E013
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Sep 2024 16:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726850854; cv=none; b=qZrrOjcs81IQ24X2SF98S5GV8NIfUSYqETFlGQRRuzga4e73+PIBCHxC4ca/JwMzR/MnNK7qJcCSihe6cbKJxh4pUYqdxJDLOUo0ALtoPibZZ84GEYyCObeRD/MKBBVS/PBKfy+wC+HJ8dWOhBIq9d3yqgIL7OKe2q+TutE6c00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726850854; c=relaxed/simple;
	bh=zsNq+PDcTEKGZXeuBcmGNoMaVB7tGewK0MhypO0Gu/k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hsHu3FcGmcSRzctHF6/XCteQX5C0MDQ8uaVC6O36dBsWK41HDnO9l4UTNDlMjNelKe+2lSV7Aiw6DqZEClNAWlYlxhhcDszuaOV6AFl3ZH8wjSoAu6CnReTnPzyS41YRI3iXrrlDO8R+FIrbTWf/GE0A+feYn0DewswfkjV2Gtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Zz36+hBl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Zz36+hBl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb58d810eso20746315e9.0
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Sep 2024 09:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726850851; x=1727455651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvG11yWq9fBDuA1GWIjJf5XkqaA0AVG/AvWx55StoTg=;
        b=Zz36+hBl7h3Bt2s1OCAGoOlI+RC6frOWoZzz8RS8+AqZLPa3Qx0R56h66kXUYH2iZ9
         vIG0p/lvVdAAxooKxZ5HYlU3Ik5a0OPdX8E3e8UG6qOR9cJka4XTDx4r2AnJLrr1dIjv
         Vd4xMRvVUCAfBFLYqo1x7xnMJnE5bIMJDrNBjvFDTB1jt5pAk27kA1jIC4iu5OFQAimC
         YZD4X2vq3z6+sCSVmToVgsSocvz1OruqnYebWdbb/UHTzIxVkVDAQHj2eHeH30wShkYY
         1AOEPydKrcuZjzlpQL1HgYQr/RXlihgfl5nmb7u8TiihV976IQwU+D62DvNFAusA5T5M
         sXLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726850851; x=1727455651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xvG11yWq9fBDuA1GWIjJf5XkqaA0AVG/AvWx55StoTg=;
        b=fp4WlLwt0m3aYPx2ZDhoKbXgwFEV4zhfWIeU/F6kB/uw4lYqZbe+W1ND4Fl/2xGkzV
         zY0Ii0/2H9qMPl8PqHGX3VWDwYaN8veEFS2N0vkviadYQj6qeFbdVPHnsIWrdNeV9MAy
         mv7+sHh2TBkgzEikh52aOlKwWOWwAmd9KlFOI3lfK6IddxGzvOmMto3UGWUiiU4cWl+P
         HgUmZlhmobZGmWIKoaAghDpfmLg77ewoVVo2Aw8aaRLtdwt+Lh5cwAvigXqUaJcG4IOQ
         M+yzsyrjnL52O1eoJmmU3OxTqBBVoRfPKHqSCXQ4jRA5IyGMaS5M0sbmZMlxaN9mLABA
         maiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3ueoWP8A+pFCWqDVkivC2hhOzmjP1yomFC4AEmod2iH1Act27Umbwd8cy4yneBQcOLbU3tdr4zONMtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzgm1nAnOJFjv55q6FseJXZ1svdG5hGMpyrzhlVPV3puAlLbkp5
	F5cLrryhCEJlYx8YRqzih2jBzzcUukVJIjb6KE6ailkNGgD+cPZ0FHbjzbrfu0U=
X-Google-Smtp-Source: AGHT+IFNfQPAgXWVZgTbiHDHxfW/w57ppwxvispcmBLKSumCGr63LrH09BizxXHzfnC2wMVwUg8w0Q==
X-Received: by 2002:a5d:5b84:0:b0:374:b6e4:16a7 with SMTP id ffacd0b85a97d-3799a1d312dmr3849296f8f.8.1726850850718;
        Fri, 20 Sep 2024 09:47:30 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8e69:83a7:a29a:ba83])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-378e7804476sm18172250f8f.90.2024.09.20.09.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 09:47:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Fri, 20 Sep 2024 18:47:05 +0200
Subject: [PATCH 4/5] hwmon: (pmbus/core) improve handling of write
 protected regulators
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240920-pmbus-wp-v1-4-d679ef31c483@baylibre.com>
References: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
In-Reply-To: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4754; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=zsNq+PDcTEKGZXeuBcmGNoMaVB7tGewK0MhypO0Gu/k=;
 b=owEBbAKT/ZANAwAKAeb8Dxw38tqFAcsmYgBm7acbao3zIvXqaNheqeFc3p0DmPTEMe5MluMfx
 h7HTttOKFWJAjIEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZu2nGwAKCRDm/A8cN/La
 hRTdD/jpC8QdC54NzWDrfJ2/jk4ANYii+AlBOJ3MNcMKC4CU+IMtZ9ACXEJiesnQK8dTHY/wWrY
 UZMOmA65g7/145Oh7G/pPCYXMZMSWVT888pi+TJybFg1wUp945EzXKiH3leu426uP1ZfQWQz+k7
 SBWOUAHA7ptD8H6qR5v4KxNXT5Z6h8cax7gfkySX/SvQffwk/wRtcKqD6Yc7ruVdifKWcS6PqTV
 TREAWioe298JtdrpeW7IZrYHhhB0qcXe+Js26t9vUE68Ed9UBH1UlwKcxvM9Y/iQ9PZvdAC9Dm9
 24/zJ/GAR7TvjT5b5NiXH9RBm9XHQtocSttHSP2XBIlAyrfTzS686MMZtv11VokoH4guUooL+5j
 vHDN2or35kkdjDAWFRozRYeQMqvCP0pV6nUzL3tJGsfFBgKbvmS5ucHok2DSt0bCNeQvlZHQ1p9
 oRiWIKFqVqh2qAS9TB4Bhfrx6C1b5FhIBAvmkdzXUhYG2W4o5QQPWNEs+wmPH2z4LHiQlPicTgd
 ptaLiB1o4FjAleovO84Z0xN0JybS0cI44z6B2IrMAvjbLnl6B9wV058NIYj7630C7FdBOC6LL4V
 x+5WB2JCuyTlLyo2XUz5vf7yL2ZP3aigr74nreqTi4CfXEX+B8q76CFqk9sl1zEt5xnlOUah+xl
 j6FNMIUb/UTO/
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Writing PMBus protected registers does succeed from the smbus perspective,
even if the write is ignored by the device and a communication fault is
raised. This fault will silently be caught and cleared by pmbus irq if one
has been registered.

This means that the regulator call may return succeed although the
operation was ignored.

With this change, the operation which are not supported will be properly
flagged as such and the regulator framework won't even try to execute them.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/hwmon/pmbus/pmbus.h      |  4 ++++
 drivers/hwmon/pmbus/pmbus_core.c | 35 ++++++++++++++++++++++++++++++++++-
 include/linux/pmbus.h            | 14 ++++++++++++++
 3 files changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 5d5dc774187b..76cff65f38d5 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -481,6 +481,8 @@ struct pmbus_driver_info {
 /* Regulator ops */
 
 extern const struct regulator_ops pmbus_regulator_ops;
+int pmbus_regulator_init_cb(struct regulator_dev *rdev,
+			    struct regulator_config *config);
 
 /* Macros for filling in array of struct regulator_desc */
 #define PMBUS_REGULATOR_STEP(_name, _id, _voltages, _step, _min_uV)  \
@@ -495,6 +497,7 @@ extern const struct regulator_ops pmbus_regulator_ops;
 		.n_voltages = _voltages,			\
 		.uV_step = _step,				\
 		.min_uV = _min_uV,				\
+		.init_cb = pmbus_regulator_init_cb,		\
 	}
 
 #define PMBUS_REGULATOR(_name, _id)   PMBUS_REGULATOR_STEP(_name, _id, 0, 0, 0)
@@ -510,6 +513,7 @@ extern const struct regulator_ops pmbus_regulator_ops;
 		.n_voltages = _voltages,			\
 		.uV_step = _step,				\
 		.min_uV = _min_uV,				\
+		.init_cb = pmbus_regulator_init_cb,		\
 	}
 
 #define PMBUS_REGULATOR_ONE(_name)   PMBUS_REGULATOR_STEP_ONE(_name, 0, 0, 0)
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 82522fc9090a..363def768888 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -2714,8 +2714,21 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (!(data->flags & PMBUS_NO_WRITE_PROTECT)) {
 		ret = _pmbus_read_byte_data(client, 0xff, PMBUS_WRITE_PROTECT);
 
-		if (ret > 0 && (ret & PB_WP_ANY))
+		switch (ret) {
+		case PB_WP_ALL:
+			data->flags |= PMBUS_OP_PROTECTED;
+			fallthrough;
+		case PB_WP_OP:
+			data->flags |= PMBUS_VOUT_PROTECTED;
+			fallthrough;
+		case PB_WP_VOUT:
 			data->flags |= PMBUS_WRITE_PROTECTED | PMBUS_SKIP_STATUS_CHECK;
+			break;
+
+		default:
+			/* Ignore manufacturer specific and invalid as well as errors */
+			break;
+		}
 	}
 
 	if (data->info->pages)
@@ -3172,8 +3185,12 @@ static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
 {
 	struct device *dev = rdev_get_dev(rdev);
 	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct pmbus_data *data = i2c_get_clientdata(client);
 	int val, low, high;
 
+	if (data->flags & PMBUS_VOUT_PROTECTED)
+		return 0;
+
 	if (selector >= rdev->desc->n_voltages ||
 	    selector < rdev->desc->linear_min_sel)
 		return -EINVAL;
@@ -3208,6 +3225,22 @@ const struct regulator_ops pmbus_regulator_ops = {
 };
 EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
 
+int pmbus_regulator_init_cb(struct regulator_dev *rdev,
+			    struct regulator_config *config)
+{
+	struct pmbus_data *data = config->driver_data;
+	struct regulation_constraints *constraints = rdev->constraints;
+
+	if (data->flags & PMBUS_OP_PROTECTED)
+		constraints->valid_ops_mask &= ~REGULATOR_CHANGE_STATUS;
+
+	if (data->flags & PMBUS_VOUT_PROTECTED)
+		constraints->valid_ops_mask &= ~REGULATOR_CHANGE_VOLTAGE;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(pmbus_regulator_init_cb, PMBUS);
+
 static int pmbus_regulator_register(struct pmbus_data *data)
 {
 	struct device *dev = data->dev;
diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
index fa9f08164c36..884040e1383b 100644
--- a/include/linux/pmbus.h
+++ b/include/linux/pmbus.h
@@ -73,6 +73,20 @@
  */
 #define PMBUS_USE_COEFFICIENTS_CMD		BIT(5)
 
+/*
+ * PMBUS_OP_PROTECTED
+ * Set if the chip OPERATION command is protected and protection is not
+ * determined by the standard WRITE_PROTECT command.
+ */
+#define PMBUS_OP_PROTECTED			BIT(6)
+
+/*
+ * PMBUS_VOUT_PROTECTED
+ * Set if the chip VOUT_COMMAND command is protected and protection is not
+ * determined by the standard WRITE_PROTECT command.
+ */
+#define PMBUS_VOUT_PROTECTED			BIT(7)
+
 struct pmbus_platform_data {
 	u32 flags;		/* Device specific flags */
 

-- 
2.45.2

