Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E923A6EFC
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551925; cv=none; b=sxKUjOUl9lIWUBHcGdVaAqsQ4OkqYUfRolthUJ+b0K2j0pYvzdw/3lQNVZAFqn/7200oWOt6Mb9LvMYJf++y5b/nQJQZIzlbV+XcPEXFKHKfXgXJg+Wi8dDA/45LctpWyDZq+/bH8BSNEM2f2OQAfGSb/7XERuxZw+kjkcO44FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551925; c=relaxed/simple;
	bh=vjGQyirSEPCyH59+4yEfjZ/svQZoa/qFd0gcNQCztj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AyL8GYMSYL3WCsq/I2eDNYGwEmsayTTslJ7Je4FUNnwjANQuaRTsyYDxOA9SXp32W0ww/j3wQV1VeSGm8DXtoDFqw0tJKgsZ/0U5kbvfQ2HK9bw4JWKH20RWf0uojZF3K7NZZZyK8yp6JppJt/4/+o8HbPcsSEUHibb4dmWj/gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz; spf=pass smtp.mailfrom=turingtested.xyz; dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b=GqMzrxOK; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=dEIhPlm7; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b="GqMzrxOK";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="dEIhPlm7"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=GqMzrxOKHa210Hyo2nbWLS7jfqp3TGnisznhdfO1sctpyuxEF7EN2ac1/ZMM0OEBbbG4ikItMHKQg7xCStfElQuNxH1MWM6iVLI0xW7PBZ6+12Yl7VZRj6R5se8dXqfOA0OiYqM503CXQaTwB4a0kw2jlwXF2tIaa+q9UUDJQDgfH9WVlXlS5ZKSUj8l5HllfgR3L6eodeuk+jFbVH0dxAdqFcfUROyVHVoRx7/2OEHXkCu8MlHArvRDiiFG6x1OenYb3Ax915+7dKctFK3k0NH2vWjvx/fES1blFhjYjxzdAxtDVnjc46bBhPYAbrga8nj2bUjyIcPNn2BwL2acGQ==; s=purelymail3; d=turingtested.xyz; v=1; bh=vjGQyirSEPCyH59+4yEfjZ/svQZoa/qFd0gcNQCztj4=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=dEIhPlm7Qv+NsZ8FaIwfrWkSsZvqZfiy34JOhOJlgSyYi7Az5DBFrp6VO1KAEMBr7bligbyPPl0GH6rj/54zqoVMYraFT/0PAAJpr/xIInTDN2TfFXpGpFAqSgI1pomNzjTRhPd+AP4dZlJjT3zGNWqFh7F92BOny3/AJN5GhiAWwPKJrmmb/YfcMJgtC8NGto6P5H7UMWMboVL4QlI5rQE/UHkHv6hAtyavWKNL0WUEMa2LGSXYVHx//lGpODnC5e+g2/NU0/9cF2Ij6qzAnPmkoQo4Ucc84XL1hry7VTqpKEUqRIeyrkLGqNxvK+PdYL+sNa1Z0XiSGYN3QxFsSA==; s=purelymail3; d=purelymail.com; v=1; bh=vjGQyirSEPCyH59+4yEfjZ/svQZoa/qFd0gcNQCztj4=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 591296:32372:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 447682245;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 03 Mar 2026 15:32:01 +0000 (UTC)
From: Amay Agarwal <tt@turingtested.xyz>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Amay Agarwal <tt@turingtested.xyz>
Subject: [PATCH v2 5/5] hwmon: (emc1403) Replace sprintf() with sysfs_emit()
Date: Tue,  3 Mar 2026 20:54:56 +0530
Message-ID: <20260303152456.35763-6-tt@turingtested.xyz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303152456.35763-1-tt@turingtested.xyz>
References: <20260303152456.35763-1-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Replace sprintf() with sysfs_emit() when writing to sysfs buffers.

sysfs_emit() performs proper bounds checking and is the preferred
helper for sysfs output.

No functional change intended.

Signed-off-by: Amay Agarwal <tt@turingtested.xyz>
---
 drivers/hwmon/emc1403.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
index ccce948a4306..964a8cb278f1 100644
--- a/drivers/hwmon/emc1403.c
+++ b/drivers/hwmon/emc1403.c
@@ -40,7 +40,7 @@ static ssize_t power_state_show(struct device *dev, struc=
t device_attribute *att
 =09retval =3D regmap_read(data->regmap, 0x03, &val);
 =09if (retval < 0)
 =09=09return retval;
-=09return sprintf(buf, "%d\n", !!(val & BIT(6)));
+=09return sysfs_emit(buf, "%d\n", !!(val & BIT(6)));
 }
=20
 static ssize_t power_state_store(struct device *dev, struct device_attribu=
te *attr,
--=20
2.53.0

