Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E04215045;
	Thu,  9 Jan 2025 10:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736417384; cv=none; b=ZY01QTvyJP1VCkIYgeS8o0a5eqSHKARFRrcAYaYUehiLmUOsRACABzPnm6lEaIgxBn+e85ZVSP3CXycWnuAIOpsJPhv4TX1lBSLRm2ESZMBM7ToWsuh5QUsniqQRWNOeM3y4RC53wBT4aOnxsOfYwilF33ujF24VbNKNpZd6c80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736417384; c=relaxed/simple;
	bh=N9MXNPcX7FjxZRfHUoOy1f5tYAXEp4CEneGSpWoWF9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/QWnjcM6ZWRS+FpMRVlbebz4QTpeH6fjjCE7CDgWM2d9SqFFoKwEIYfNDODeG4+AMPvlK1PX9XGN7mmZ58x8MeaiWE/g+7T4kvD+VODdj1diPdhbcPT/bemmjwjk9e9WC/Z0kJ6NuZLJFo1gKrJFltnT+Y+15TsGDxGfWPVMPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilUZwGF4; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilUZwGF4"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54026562221so726961e87.1;
        Thu, 09 Jan 2025 02:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736417380; x=1737022180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=buIEu8F+tmWQN/Iduxju9T5NcyO8HpZkuguISTyUdb0=;
        b=ilUZwGF4oI4G/Qu36O5SckafNUtxpjHEDmOwyFXGY+9FIAd6CYrFt8dTciDV1PWzrt
         0uGrUYJDi7fPfqSBJt3G41bolOdShl8k46A46DV2xiNTOFJM2YNCvjbRApSgLpHulEai
         qiaYe8mtC+7qYzv/arDeIlbxB6ItngAZGwNIJJ05w+3GSpyMkL3YTcXlxsWR65biWl36
         OsJSsxEHth0l+LXVqPPDI8b0gqsBJvxfZoUfTOML0wZ1YWbiWvWUkAG81eGhLGuM+Cpe
         sLNXMMbwrA+FUYqKAqG+QKYjo4KKDBpXL+laGdVWi087HGsVkztxFUtbrIWMQ+D81oeA
         i3ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736417380; x=1737022180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=buIEu8F+tmWQN/Iduxju9T5NcyO8HpZkuguISTyUdb0=;
        b=pYCxMKpcY2iuNpcwwyYVzT/FYf+RNe+r2qEjWND32PTZyZTtsP65FaUqK+oGmTrYm7
         mZMeiOzuQuY3QF/FDqKyjOrOp6rDqLAyz/QOLvGniKwyjvTMeAqq1NY+MYP2S5q/FwAb
         AAYWFzc2ANF3YLhTZAy+IUlcEPKkocGOWRtXIV9pZEZgIBCKb2NeTJOZGLzAhoquGgWj
         9SFwAFzbL0IfLOvUHepaeprBzMUAFLIsIJFz7M8fOi8GciKKwMWLP/8ol+Yt0EDwRBrR
         Z6oR4wBWEEPfn52glsgu9+3DyZ9DWmLlSNSlchtTBGDZ6dZCLvahbfP8mRNIvdozIty+
         1Y6w==
X-Forwarded-Encrypted: i=1; AJvYcCWDuf6Npem854s/uZak2H3V8L8LFX4ZfLyVJDXf5Ladrz7dE/IzF07UomzySvaodl5gtTJCh0zb6U+Xp+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtOiDsXODcjKOWNAIwaHv1EkOlC3zyTTWVBxguKhNlgZL3+ORP
	RKE5vHWInxLOtl5IjCiFllX+cA4h8KhoYLzIWvz1klegv/5VRzYs
X-Gm-Gg: ASbGncumAL3Tz0teVOjX5ddep2lamn7hK4n8bZhY2xmiEuFn/0DajAY1tibjyypV3Rc
	kG5yIlS7OlFZEL8RhiQJcix4GpJ/cqk0C4bm1YhRsgE5GuAN727bGXfh6XqhKh7gdk+I6fQ2x85
	2VMJm2jW7KNorxIgw+c3qiUxnOdnkG8DcK4vTK/vRAsVtepLzKC1QnzTzmRWK/+WI1XV6RasXIl
	RWUBxdepBS+bWwvYcVsTed1JUcBlyChEgw4T5QzkXBiGObUsQIQ7kzo
X-Google-Smtp-Source: AGHT+IHre0GQP1JxRtOToB5Q5Myp+uzjpc272IkgZm//dcA1gL3Z2EHA5bGB0Zs8cCqcJeIjZrp0LQ==
X-Received: by 2002:a05:6512:3049:b0:542:297f:4f65 with SMTP id 2adb3069b0e04-54284450352mr1859921e87.0.1736417380236;
        Thu, 09 Jan 2025 02:09:40 -0800 (PST)
Received: from X220-Tablet.. ([83.217.203.236])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be54092sm152073e87.83.2025.01.09.02.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:09:38 -0800 (PST)
From: Denis Kirjanov <kirjanov@gmail.com>
To: robert.marko@sartura.hr,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Denis Kirjanov <kirjanov@gmail.com>
Subject: [PATCH v3] hwmon: pmbus: dps920ab: Add ability to instantiate through i2c
Date: Thu,  9 Jan 2025 13:09:12 +0300
Message-ID: <20250109100912.10054-1-kirjanov@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for instantiating the Delta DPS920AB PSU
through I2C on systems without devicetree support.

Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>
---
 drivers/hwmon/pmbus/dps920ab.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
index cc5aac9dfdb3..c002ed41f517 100644
--- a/drivers/hwmon/pmbus/dps920ab.c
+++ b/drivers/hwmon/pmbus/dps920ab.c
@@ -190,12 +190,19 @@ static const struct of_device_id __maybe_unused dps920ab_of_match[] = {
 
 MODULE_DEVICE_TABLE(of, dps920ab_of_match);
 
+static struct i2c_device_id dps920ab_i2c_match[] = {
+	{ "dps920ab" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, dps920ab_i2c_match);
+
 static struct i2c_driver dps920ab_driver = {
 	.driver = {
 		   .name = "dps920ab",
 		   .of_match_table = of_match_ptr(dps920ab_of_match),
 	},
 	.probe = dps920ab_probe,
+	.id_table = dps920ab_device_id,
 };
 
 module_i2c_driver(dps920ab_driver);
-- 
2.43.0

