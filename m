Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AE848C415
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 15:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551606; cv=none; b=PlP3HT4uI7s5/lkkfJOoZhn9ke4m57R22ueygFoobfl07HYtErKR9NIA7el6HEmtXbtU6J95de7yemoLZYoBgTgk1SAHLWtqCo9y4IbVSoNZ+4a70hsUTIjVFpvLAte59LqVseXKoACYJcP4U+iueLj5SZNK4LG3nJP+FjQpktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551606; c=relaxed/simple;
	bh=MLnop1AJfhN68GesHLgsTDQ/sL654odA1Be3o4pJaw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S0ugJ6H+oXYphhcrHxBA2g4lSqhwsJJV2ddKlAQFdcvVkz4cystgFwQZWRG9lMRZBjWXxkaOjolTTvDbCxNQy/Ph8RHVxyvLHUYfSnxUZP8iPguT6ZqC/3a/cZWa8isXdZEIsOC5KzO9GhqmjCrcRCvmR2xn55pmysvYXFnSpqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz; spf=pass smtp.mailfrom=turingtested.xyz; dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b=YZAba+iH; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=SQOdi94s; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b="YZAba+iH";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="SQOdi94s"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=YZAba+iHzVHf1EuYTUrOYnV7uAJFWLK2VxCv31epJEqWILTd+b3WdtdowYWQT1io/45sLBqfleq6XrcsQh3OQ7O7dJ1BDBSKpGD5SnJr/+Ec34RwyU6XEPdCBTF+AfiTvKIii6TK7bER4npyjCGO8RW0SyBOsoRE/AlxTbofayikG2DZdwWl/nEQ/8kXiFuj5RuRS8inCV4M5x7Prl7sOuZm1f5n0agzyBSPmZf3AXIIF/Ha6sgA4NIGVwhI4WtNE+VlVV/W4TcidwLGp8+4kKSMQDg9dy6KnOpsw6mZYfKHK+T0cT10NU9t6TE9C8uShPfCE14szGR9rTEOmD4oxA==; s=purelymail3; d=turingtested.xyz; v=1; bh=MLnop1AJfhN68GesHLgsTDQ/sL654odA1Be3o4pJaw8=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=SQOdi94s2s8f9wQVxgNKiqtor0P9QBZeC19Kuo23B3tJUVR36jeN2rfCBPQVg6WYIPoaQ4hnMmJ1V8xi0/3KIJrYst8kKWz2I+YXStVXZAk1TWaaO5SfJxYJCMQTEmGZmeD1FSIiGxLmkv8vtmBY/ZKpCXBOEkJf6J/EcQ4v3M1sQ5UdUo4aziX5EJcSz24DD+XYLWSKatMm6AKu8Ph8YWrZdA/bAgqpA8HSlLQSz1RK7vWt0/jNHUeeX7JgwmYhKJYcxKFPzb/E4ctFoCch8uSsdKReXn6/5es0wYyLxZzfNoHl4DMyOKkYARG0PHFLf9ZGgRu1yLpGZgleQiXWiQ==; s=purelymail3; d=purelymail.com; v=1; bh=MLnop1AJfhN68GesHLgsTDQ/sL654odA1Be3o4pJaw8=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 591296:32372:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -401779567;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 03 Mar 2026 15:26:42 +0000 (UTC)
From: Amay Agarwal <tt@turingtested.xyz>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Amay Agarwal <tt@turingtested.xyz>
Subject: [PATCH v2 1/5] hwmon: (tc74) Replace sprintf() with sysfs_emit()
Date: Tue,  3 Mar 2026 20:54:52 +0530
Message-ID: <20260303152456.35763-2-tt@turingtested.xyz>
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

sysfs_emit() performs proper bounds checking and is the preferred helper
for sysfs output.

No functional change intended

Signed-off-by: Amay Agarwal <tt@turingtested.xyz>
---
 drivers/hwmon/tc74.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/tc74.c b/drivers/hwmon/tc74.c
index 9984373a25fb..7fb7b50ad1ad 100644
--- a/drivers/hwmon/tc74.c
+++ b/drivers/hwmon/tc74.c
@@ -92,7 +92,7 @@ static ssize_t temp_input_show(struct device *dev,
 =09if (ret)
 =09=09return ret;
=20
-=09return sprintf(buf, "%d\n", data->temp_input * 1000);
+=09return sysfs_emit(buf, "%d\n", data->temp_input * 1000);
 }
 static SENSOR_DEVICE_ATTR_RO(temp1_input, temp_input, 0);
=20
--=20
2.53.0

