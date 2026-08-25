Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9C238E5E9;
	Tue, 25 Aug 2026 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787648845; cv=none; b=EE04d0GvgzZVy6MSGPb3mFqVU5f8KuKQFylYoXu57ZTPCgBu98rQzP0D6es8ZERKPTTG1RbPBzEwlzF6L1s3GvuaXCovOEwS+gZIEISAMA2xCtQ8hqRE/M8j+kVSE39cuu3xI/xZ+y3z3M/RZKqdqhqrRh+BdvEJ+JRzHbSyXxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787648845; c=relaxed/simple;
	bh=QqInqnDLj6zgWGxVzPElOnxkPt6RYvijvLHyI8fNSZo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=rWzifFVWFXgQi7v4L6GZFRKQ4vbgrvKaX/GLIVILK98JHDkVW5U0fRTYZCU6R6MjWaoWioHcrJUZpNhj7sDA96iidJafKIhCMs+OJOfo3A4pDzpXsSU+hPkgcvJ3zzIOVlsz2VWJgAYXQLBw5boezpghe70dNu3ANd+7imlPf8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=aJF0AqOV; arc=none smtp.client-ip=203.205.221.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="aJF0AqOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1787648834; bh=QqInqnDLj6zgWGxVzPElOnxkPt6RYvijvLHyI8fNSZo=;
	h=Date:To:Cc:From:Subject;
	b=aJF0AqOVdX+3z1gBVquVow3OUAQPeTA6MgwVpsSXyr1v8TI3BHXDtIFK2BE3TPCUp
	 DOEdNKwB9Bw4K+5Ic3iKGnw+L5o7iwFR/xIDYkaO2haqVVn73lOb3prTHi7WZ4OuA9
	 8jv+nhVz8gQA+eMm4BzNKZb9HUr1cDzMXy8MZTeQ=
Received: from [192.168.255.10] ([111.206.145.19])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id 1CC93C63; Tue, 25 Aug 2026 17:07:12 +0800
X-QQ-mid: xmsmtpt1787648832t28o64uhj
Message-ID: <tencent_AAC779A9883986227B9F9C29CDF4A4AA660A@qq.com>
X-QQ-XMAILINFO: MCMeKXle1ehRVFFirHZ9kIx7SkUe2rmfrSbjcigE9heo0xeeGdFWD25VhAJZw3
	 XSDbFbRCgA2+yFg4A+ewzVVPMAfbg6I0qwJ+8u6cVyfCq6/zLHMy3sHbJvhi8UQaMqFCAxV8dqg4
	 rtnSX9b0TUcjwpOxC0/b6CRYGVda5VkcYhA3QjeUmwccmOmsulANaRjoi5a2QP1WmunGAH1Ws3vq
	 nRbp/p6QN+jHL6l8HM5SW9CdOAdJEuqLEsMIb2SNTj/Y/SNbZfeFVkqo3iIXYC4x6Uqq84N4d4Tj
	 S3eKrV9S+QG18NTpdUSYn0ywrjQCNsmILKCyK87h3/CSxGfmGjxve9QRmEFvKZ+zMLrzp1cG/GRN
	 Qdzfvjw7sAnPa5PvuPhUcCEkSslN6GrTEuIABjiCz4+1V0VJ0ArN7d+n7cmlb2IqLt1lTRnSLe0H
	 QU2Kc1NX89ZunTreGOXS217KzEABZv/oIQGW2wcTy64IRCZ2G4zHV9QQ5HkwC2i5t86WbZsvj2r0
	 iwpYZzMy4HG1LnpuoZ8R/29Z9LKUbnjZBs8ThWF1+olKnhgk4lX5qJFKTxi30QjVHUqE2fNJr5mO
	 N/7/LKX+QFlArGCDs9Jpg+P7qMh3qDMXsA6R0vfkiNzml20XEBzL5H7cAw9zBrXDcPn3wLAGqV/t
	 ra/dZDEge3QQ+I5AxUCOy4cPf1tFOonBk7yBY3VivtaKBd43y1IihllF1TWHFrzMSMqKU/EVcCaT
	 i8xvdaWbW2++QtfIarE2osFTGCuPXB2z1933t+lXgvzOIGAs/cN1xTNsQLc9xptCsQ6PHO2yslzZ
	 a1rW+TTZDeQ4Ni6eznLpUK0t1bZazs6hfTdKOjOcnUTPHpm9gO/284mrYea0KPY7EO3fMb6/xG86
	 wKsHRIbmYf2fAJDCMhUZsI9JbysU+Ub+HVzuQfdgDraBhTJxvhQX7eK0u0036eMox+dnxjBwdty9
	 +91szDTyWsDyg3Dz13n5otJH77b+N6wQgsMBzRpxIyh23Jm2cczCrbeq+PFptDM23PcxqhPsPf5c
	 h0NMuhQts2E0jQY3mCHbQVrFXjOVhQSqF7/yKmFnFhrjYSgxvKoa1DL/Gnxj0pIuRBxfnq39cMw6
	 ug1rxsXJtDWxscyH0=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-OQ-MSGID: <d5defeb7-bd84-43cf-82a3-98f55df7c769@qq.com>
Date: Tue, 25 Aug 2026 17:07:11 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wenswang@yeah.net, linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
From: Yang Zi <2959243019@qq.com>
Subject: [PATCH] hwmon: (pmbus/mp29502) fix potential division by zero
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The vout_bottom_div and ovp_div divider values are read back from the
device during identify and later used as divisors in several
DIV_ROUND_CLOSEST() calls. If the device reports a zero divider, these
divisions trigger a divide-by-zero error.

Validate the divider values as soon as they are read and return -EINVAL
if they are zero, so the driver fails probe instead of crashing later.

Signed-off-by: Yang Zi <2959243019@qq.com>
---
diff --git a/drivers/hwmon/pmbus/mp29502.c b/drivers/hwmon/pmbus/mp29502.c
index afc5e8c07e25..d606fef82b35 100644
--- a/drivers/hwmon/pmbus/mp29502.c
+++ b/drivers/hwmon/pmbus/mp29502.c
@@ -134,6 +134,8 @@ mp29502_identify_vout_divider(struct i2c_client *client, struct pmbus_driver_inf
         return ret;
 
     data->vout_bottom_div = FIELD_GET(GENMASK(11, 0), ret);
+    if (!data->vout_bottom_div)
+        return -EINVAL;
 
     ret = i2c_smbus_read_word_data(client, MFR_VOUT_PROT2);
     if (ret < 0)
@@ -160,6 +162,8 @@ mp29502_identify_ovp_divider(struct i2c_client *client, struct pmbus_driver_info
         return ret;
 
     data->ovp_div = FIELD_GET(GENMASK(9, 0), ret);
+    if (!data->ovp_div)
+        return -EINVAL;
 
     return 0;
 }


