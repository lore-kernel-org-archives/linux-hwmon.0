Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3165A2D8372;
	Fri,  5 Dec 2025 02:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764900205; cv=none; b=muIf1uqr1EhQYY7TI+wjv7FtKfQ7bK1L8d7i8QEI/pQANydTn00JWZwWM+KgUcO5hbeoLWddLdhhu8dNzEp12XXto9rYR9ev/lR/10TRGEtVB1PxaHGN3OoJDvNOhA+Uun1RuufANPG71AwjCEOiIb3R/0DWyNjjEfrlJx7/O0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764900205; c=relaxed/simple;
	bh=jGJ3WCxqjxlm1/6f8sCuo+hqGCv0d208NTg/7bu8NNM=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Te9ppHX6j/SvARIarxAESs9Cm/JAb5naDid/1f/QKe1CTbGlXvvUcisXBmr6GSkOvpy8dMYAYwQbgDb3em2ywjfKU5uaoVVd0gBvtiU7o28mzdVF+42eZwoWw/rkpJL5SVHjZR4N1svfI26rtqdMNs7Yj1mWUJZ8qo5hnZVGDoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=FvK74/2u; arc=none smtp.client-ip=203.205.221.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="FvK74/2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1764900184;
	bh=WtGHZWEEXBE6iz4b+evX2eivlSYIeNOAhPSAenpFp08=;
	h=From:To:Cc:Subject:Date;
	b=FvK74/2uW3WLHTKhsOt6HpxJhC+6vSFFIExu5KRld3QdINvRZcBTx6XJBAFrUBW6+
	 0WGDSx59E1cdtdSo+aTTB8UYtyXadRjP0zVdFVrc+Ux3Y9MsucbDNMDH/78EJDBXKa
	 LzMuc2dW6SZ+DeBnej8NVuIy1EydbslzreXRRxXY=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id C301A72; Fri, 05 Dec 2025 10:03:03 +0800
X-QQ-mid: xmsmtpt1764900183t6qxgqsya
Message-ID: <tencent_CD373F952BE48697C949E39CB5EB77841D06@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uz7rxUxc14H7e0F6HYCjbIqUytRL8IzfkjzDkPEL0qW/oKSQ5gu
	 6TS7Oiw4yvrBhZiMGomvwfwOCKoZ66MrWcL1ajIHaV3E5Q8AHLd9/CxBNgoRObJuJaRk1sCCyLwB
	 5nudxeJURFM/mB1CXDPflf4dUzlYeN78mJtRcLwzvaOU4R2ofVMT0sziI/kx8s+W/hiZzkPPlVJ/
	 3UU61g8RmeXpX0Fn/4HBdFCBobE5sNmwmeTU1gMQCTfN8rKziBxne362C2IrtcBsEkuR9qScQq/Y
	 Mf7/4UD3qoVn46MkYPaeH6VoYUI2DWqTqRT7KASMyVIYSIcOZ2T2RrXdAMRWGcKdXUyRhNRl0Yqh
	 PrFEY6W7uWvQzJEZoL7CODzd5rT8FsZASnQcd+v5wvp2ArYNooBOmEN1mbxo3XtOx24jH78SsjGr
	 k1+CSuSU2xyFTzKYe+lQTpZWRiaTmK92UlkcEWzPCEAr/1Mtm4jPzAEKv64P3QAafXFRqRLWr4tJ
	 Sv4QiVP/627E/MEr22/Jqi4m4c9a09DemeYlY6e4ZXhMtZXh+cAbskspkK6chyXokLSPKqApHH2z
	 SVYYUcHF4oDF6HGdB5ewo6lFmWESI6PncUpJAfoC7xrD5/hHyOQObESZtoMYs6Hn1VSTAh6rYFd0
	 9finsPfZehXgLqHB6zVuXeH63YVEisapd0i1ov9kIxEV2IXpWutv5iKtFzQmJfbN0aXNvhim0rNM
	 p8FhAAPR3w7lZOX32eyrnECpz5jJricMM4v/flFkLTCXg+C/KANvhx8Qn9GvfQxKzs6GsCu/ogjo
	 CP3x6BGhvDZtu0zX8/ccc53AjjUHVK4cl8VZJ8UBpfH1M5BGkiCWbUvsMRDvA+7BwJ1RM/9THd4G
	 PDcw48hQyVYqRFrZuJ3A12+xRHlf19CdsXhZGeGtl+k3c7vBnwj3NPkSdlb7jv6CAZs7A/gJ5w93
	 8cz3zOIYBWiYNFJcTmn2/QuToRT5dmy0EI4DSQG63Lz0/rZUAcjQ==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: xiaopeitux@foxmail.com
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] hwmon: (emc2305): fix double put in emc2305_probe_childs_from_dt
Date: Fri,  5 Dec 2025 10:02:41 +0800
X-OQ-MSGID: <65bf6e4b1ed2571bcfa6b9fc9f36db204d81e189.1764899917.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pei Xiao <xiaopei01@kylinos.cn>

./drivers/hwmon/emc2305.c:597:4-15: ERROR: probable double put

Device node iterators put the previous value of the index variable, so an
explicit put causes a double put.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/hwmon/emc2305.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 60809289f816..b0f2318c97e3 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -593,10 +593,8 @@ static int emc2305_probe_childs_from_dt(struct device *dev)
 	for_each_child_of_node(dev->of_node, child) {
 		if (of_property_present(child, "reg")) {
 			ret = emc2305_of_parse_pwm_child(dev, child, data);
-			if (ret) {
-				of_node_put(child);
+			if (ret)
 				continue;
-			}
 			count++;
 		}
 	}
-- 
2.25.1

