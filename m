Received: from outbound.ci.icloud.com (ci-2002k-snip4-6.eps.apple.com [57.103.88.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779D83E51D3
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.88.237
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789373425; cv=none; b=QZf+MLMzBHJ/6S09tc4keYaMJvs/KrKD7rtWKJ5od52+AtuIZRLOVVGei6lnRKLJl/4RuCsqNJ3J7w6BLkZNTOXfUC3yqtYXmCBp6bxMtAhuK2VAAnokWylNePFuUlialnJrFYxqrouwXxmJRc4ufKD0a2eAvNdQuT4a+ebDMJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789373425; c=relaxed/simple;
	bh=WVLrlQuMsT1iq4HLaXaRBiByedSlQFJ6Q8mIvDJu8/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J8jl9X4Nlwy3FReoGdJIwrD42qer7yCYI2/0bToTcyYogMiRULwGRwJ3ryE4HNjZHE13Lk9q8KhWUNRngfjhi349ap/iHsIj+QKi48GL7EkSHDvg4ZMDXyJUdPw+XSKZNsC+PmYqwUh4rZAgvAcSYiiQXsTuw0mL7cEuC7LNuBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=yXzMtkjy; arc=none smtp.client-ip=57.103.88.237
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="yXzMtkjy"
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-20-percent-0 (Postfix) with ESMTPS id 607801803215;
	Mon, 14 Sep 2026 08:10:21 +0000 (UTC)
X-ICL-RepId: 01a09ef7-96ef-77fc-84a1-15d64969dbea
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhMAUMGWgFeC0odXANcEhVdRUMMQxtXAHkVVkNUBF9QXxwOAFJFUR9UWEEOCl0SGFwUXFBYHkYSVg1dCRkIW15QG18CQg8cE1YVEx1DGQ8rCEoEQwdFAl4LJRMJU1ZfFRcbXAAXBlsUBEQBXQVdAkkITANVB1IHRRdABFQFXh9BFAhSGUcOQjBUHR0OWAYMUE0BQwgKAlEcVg1X
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1789373423; x=1791965423; bh=Grqz1NULpAgzv3ObRtUmkKvcgSLrgeGPdEtHhY4Tf6k=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=yXzMtkjywkSa/i6L27D3pxvvNFOUUuyrtYuqtY52PS9bO0mfu4GKi/1HG1gY6WTfPj0xFEj7t8hClvutScUOgJSQfAB18XELWWVa/PCuoAzSjYu1kW1pfMae5zMAkArXAAbXg0WZffXliHbHKUfa2M8W7VJEOCzHcgy7NtnVTNoQjq8VqhuVQaC8MPfzmlWX2N4HgGN84t7XnGIHm/q+ya8reOd0dQ1nmD83JK3G/LZPqlmvtEZg3+0YDUtjLVa5CJKcTDR+Fvse6wcJ89ht3IG4l3hqZUt9SBHgzgEF6HrZlx799Xq6hVF8WfM9mqhKI5TJrrFTveGxA6fcS5L8AA==
Received: from dell-p3650 (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-20-percent-0 (Postfix) with ESMTPSA id 64F181800171;
	Mon, 14 Sep 2026 08:10:20 +0000 (UTC)
From: Patrick Pepin <patpep@me.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patrick Pepin <patpep@me.com>
Subject: [PATCH v2] hwmon: (dell-smm) Add Dell Precision 3650 Tower to fan control whitelist
Date: Mon, 14 Sep 2026 08:09:55 +0000
Message-ID: <20260914080955.87925-1-patpep@me.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913112925.11393-1-patpep@me.com>
References: <20260913112925.11393-1-patpep@me.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=DIuCIiNb c=1 sm=1 tr=0 ts=6aa7abee
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10
 a=-UwBEhI7gGgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=HHGDD-5mAAAA:8
 a=aSWZaw_ONm4TnRRh5LEA:9
X-Proofpoint-GUID: 956thQSqeU8ApX6-ShKpuO7DzrHy9oLT
X-Proofpoint-ORIG-GUID: 956thQSqeU8ApX6-ShKpuO7DzrHy9oLT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDExNSBTYWx0ZWRfXyvh1K3Jg2nHs
 snRyMLIb1fKVNuiqpZKGLiS4B2ZDts6qL7gP+57BEbSYaltC17NpD6fV+jj7dgzFzM2k0jiEi9H
 ToyyNJBXduotprzkH6Vvh6xMvCOp8DWX4Zr8RxF2YJYWruRG3iL1iVZOajcsdsOzyQeFTGByqjE
 6SDG21V89pjxy178xFPS8OkNdP8wQ4NeS8gBw8FO9tZqWbt3LQJ7ekBN2C/ZEQ8Bh7a1XLcA3xJ
 2TxCdR4ldsJBTXRErBH17xJh4uZyd5/pksqChQrq9mpeHfJc+pM76O87Utp/Wwh1Rq3MZXdQ5j7
 5pI39u7BPMig5yNHoWUvKPlassL6ls9tAqTDEboV/BKzkSIUmywJRpGZXmsLZY=
X-JNJ: AAAAAAABFtmFkGpBVdEXkDdRSatZ9S3j/Cn6DteNWL+rZO+N4eAA/kihYOcACJSMyjFOAJYiPzHZbidNVV9nTUJsN2iTN5TaSf9FvOl8zTUtYnxBSZGAVUJTXN0PfZ1VKoIEdz/IYjHASNACJW5fj5j3RsyO6JgXeMsITDvmCgl7q56F3YxVqwsJY+n3XN7Qb+qABsfkCZD5RiVklQ7OMH8qKQ3+cO/lBrvZby6+KhMV0yVFotJSXx4oIFzgjpXI2SzxodmVf8bwGBWcFt5Pn6+Z+auOtUmdioWPaTSD1YTqHpDPduZsM/npa7dNfQFe7lPr4Yox1s67361v0RMQpZ/eGOjS8xjzvZlCnhVPi2+MyhBzhCV0aD6XnO0oMgQH4f6C3jlxJG1r89k/ld1Z04wirS6Qn6REqc9liLfS3dDr1jc3kHFT5KGZSiXYlKLTXWlnmRne0BjSqq8+IZNhM7GMjI/dnWAZ87vPBffKhTzCcvgFntp+YKvIUXy64acdDxFBpgDwjV6Mi7Mex1j/BSwp2RLk7+UqzFMOGR6jzx0+E7B0M6b2vEXnTkWQYiXtNjzEx0tmNRu2/sqLPfDTaCuAHlbYBuEYGUsL+w9e6pbrZ+9i96ewGs8V1FknjTBDPbIsWTQ5OPPPDvSCttcZyNL1m3k0qCy/uyYFm+X7B48OjF9vHJjH4bqA5Txwqpod+tai3NXZPpmdPL1dZ5qTaAy3qXc8lIqxqMia/HHkgeeQJRZWD+R1uwIU2fJGb6Pb4ASnYsbKxXG3LYiu5X4SIqlDBfisJURYbcVOcvG7Po6U/zQQODVMSYF6JziBbIa/9Awuq25NhsNOV63QuVIwJfOQlUkmGSXbFrdz1z3qnBLcWulnWljYNoEDB1XsDGJznIi6MLUJKhtTdv8UhCg3z4R78NoDwKr3J9HXEfocgeKkyxgI8g9nTXudW5qG3Xuc3vGVYY5nde1gvkkzMWpfkTEMRtQoa8I
 5BP7OfFSG5Vrb0JoiyeUmQe770iWymbOl9l75KHkk7MC4f1fxzIJXyPDOeTzxajEyGNzrj0yfmQ3TvRufB8vmjJ/Zylj7D5Us3Kn/X9dtFlijPZmS2ZJWJPlccsqwS8dfLHCNrnsFDMwouC5Jt0fmnk0HFumE/l2WuCBbK4KRSwRTudSs8xYyoau0MDHAG6p9LaGeKJu3OwbNZNFnndlSfLT9XMlB1nQj17TQbDpg9SPgpyUTZtAFFUMos7/ozwFBWOMnlSJrua0=

On the Dell Precision 3650 Tower, the EC ignores fan speed writes unless
automatic BIOS fan control is disabled first. The I8K_FAN_30A3_31A3 SMM
code pair works on this machine through the WMI-SMM backend: after
writing 1 to pwm1_enable, all three fans (CPU, front, top) accept the
three fan states and report matching RPM, and writing 2 hands control
back to the BIOS. I8K_FAN_34A3_35A3 was tested as well and also works;
I8K_FAN_30A3_31A3 is used since it matches recent OEM software.

Tested on BIOS 1.48.0 with kernels 7.0.0-30 and 7.0.0-31 (Ubuntu 26.04).

Signed-off-by: Patrick Pepin <patpep@me.com>
---
v2: use I8K_FAN_30A3_31A3 instead of I8K_FAN_34A3_35A3 as suggested by
    Armin Wolf (both pairs tested working on this machine). Pali's
    Acked-by from v1 is not carried over because of this change.

 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 7ed94a3db..99a58ed26 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1639,6 +1639,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
 	},
+	{
+		.ident = "Dell Precision 3650 Tower",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Precision 3650 Tower"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{
 		.ident = "Dell Optiplex 7090",
 		.matches = {
-- 
2.53.0

