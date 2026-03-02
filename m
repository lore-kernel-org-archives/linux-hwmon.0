Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04307271A6D
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 19:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772479765; cv=none; b=h24WDnL4Sugo8nNFznvx7/eeajJvcNaz2JjBo18XZVOZa7sGiTp9c/1Q+sUr621J/nkRYa5H59HW9yyJEknrh9EEidOxKziiHVms2pWeTH9J5pBRQsZbXuww0W2kE2GtpKwNzxEHznzWGh95/b+HCFCVOwTTSyBtbUi8tlLlVIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772479765; c=relaxed/simple;
	bh=qsykus7gxRNzmK/4y8GoESGSzWi2EY5WrCj3D1Ord9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tXtlv8e3TLl6+iPKAn3oXRmumBlMZpXkkb+yovKynZ1yA4tYxsqKb/zS3zLMY7GyXCOROZIwmHutWC3JoASAudXeFvFi+RTVHyxPeJ5BoJj1gmvBhQaht2j2nCpKZ5o9rY2CHxoA9PZn0fsCvIKOAKucUHysFPURqO8e1nVvHiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz; spf=pass smtp.mailfrom=turingtested.xyz; dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b=O0WRWnGv; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=sO/PH1L3; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b="O0WRWnGv";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="sO/PH1L3"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=O0WRWnGvAe8nB6ohPUvqxqtvR2rLOvPohS0rfT/LLgCYQyi6P80qerc+By40xTIeScMrVW3VMtzdGAAYCMZlrXYegyaM6xG5/wyrsOsXjlqpKB5CusLsDYR7Beye/EV2iDE4LF/ci0HKjDgAkcCo/imlpb/gG3qs7lsfVfU9Hs3MrpfhIHxk9wAs99RaTyhh3nlwIXEmujVdVky9s+zg1pxnbdd9cZzwG6Y0hTqrUvgoKiyE0cayHsTllzj6ootOEDVobINidVJpAl8JMrsmMdMS3It2sdb5miGqVhcrWLNZ69QowcRg0K6fOaYNJaaTdcIAfLjftDV5aAA5myJAag==; s=purelymail3; d=turingtested.xyz; v=1; bh=qsykus7gxRNzmK/4y8GoESGSzWi2EY5WrCj3D1Ord9A=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=sO/PH1L3esv6Y/PZyf0z0LMSVPvkesbLA09D8X2rRbttlfRxExl9lOkXCswgLFPqHPFn7AudMC38/tlroqoc83+n4soaJ+0giRqZW9698vjMrPCdMnuPxK1N32Ucd3oBvU7jitzRWbRcres4I0KFizRzBQH+kWbOoAH9Eg2s1+VdNRJ9SVRjP73v7g64dMEaD8iB9jXg9sfII6VF0GKy4wMUDiITEkl8muRYUiYzhj3u48cqnnUtbu38de49tX/T0K7ZAhUmXA4qGIYix4JcUzB6yizkSkebhK8yU0Xse1wsXD7hM4MmNj5lEr25BAJD+YKKrHajts1Hp55AmIPaqg==; s=purelymail3; d=purelymail.com; v=1; bh=qsykus7gxRNzmK/4y8GoESGSzWi2EY5WrCj3D1Ord9A=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 591296:32372:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -8130386;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 02 Mar 2026 19:29:21 +0000 (UTC)
From: Amay Agarwal <tt@turingtested.xyz>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Amay Agarwal <tt@turingtested.xyz>
Subject: [PATCH 1/5] hwmon: tc74: use sysfs_emit() instead of sprintf()
Date: Tue,  3 Mar 2026 00:58:12 +0530
Message-ID: <20260302192813.10625-5-tt@turingtested.xyz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302192813.10625-3-tt@turingtested.xyz>
References: <20260302192813.10625-3-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Replacing sprintf() with sysfs_emit() for drivers/hwmon/tc74.c since it
is the preferred helper for formatting sysfs outputs and preventing
buffer overflows.

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

