Received: from sonic314-14.consmr.mail.bf2.yahoo.com (sonic314-14.consmr.mail.bf2.yahoo.com [74.6.132.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5440411713
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Nov 2025 19:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.132.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764358665; cv=none; b=abLB9q61+urkhuQuVTH4jafH/RLbcNQIoaC22uMCAG7VLaTscqquAFpynCZlJHjuRGJ3rZrW/QUdgo+qbpjZTJSHDEWeKcTeuVjbwzhx/E2kXeO3lDDxUV3+u7Vhs9vL+0SszRHhr13rmxGpSkOkVCHXeHuHBB7ROQHw3pkcjN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764358665; c=relaxed/simple;
	bh=P89zjrJjnhYg8MI45wyNdN3CI/Kg6KscZhjPYumaEO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=RJxNd9yAxgUUciN/q4fIydLTMk+t8wWW8Y/ckGwAIp373vqk03qRbO5xr7/YAoOM4kNTbxN3mCwBIsFm1OoW/Z5QIchNCnxy9z4wudfqCxHleWIh0NfmGMjee1j2ANMh4dGpgilQuT9XgQ9g08q6vha/vzKzzbmLG5f55PuiOJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=ljxq9f1r; arc=none smtp.client-ip=74.6.132.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="ljxq9f1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1764358662; bh=/imNAyVhvZ8TOg0oltvBr0FX9Hfi1va6A4q2N2WEahQ=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=ljxq9f1rDgvqezH/EQeCIcP2YNmQd+msCBHYpRTsAQf7kHjRt6R8IFBwpB6P6htYhSuWXwzI8NUkA3SIBeDr4OJzKvpTN+oiQ6ESwXabFHLjv6YuAQYS8GjEBxdaBKW3sSZTbmg0vs5j9BDxm40JVtltmKquHK9Ql2yYYIxH4not05SVNLssslkVBBr2aU4v8ZiUnpiOxaDJ/jGtiJigKd9rfTUV6x3D7MQTtnXGhpvYpI+wbcUE185CDpoAvndhlZRF6Nooec001k7P6EBAgYL00nklHyLZcX76Mu8vTO0OVSuPX6VP29MHxO/8vT5UlWM4t9sdJAEW7a3haXDtZw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1764358662; bh=z3ZpyEUmeG+ubY74aDOUFubqU2T7aeI+eFX6WzIVVx5=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=sKhmLBTtSaEjtMn3kko0uBWOHsgaFQCqJhaU7mCB9S9SlXcihEvcKzi/yOO/vuDYonf/ZOuDYIYkl1lNPQTIMyL3GLwExWXbds9A/aKTO8iaeY2rgjLzzUqSYjR8pYoTF86Qs0oHq+IZ+SjUmfJFaeYMtFvUdDW+NpFjKWExLk/UEAEG15RzzA0XEnhN7hEpzE8SNSsKTXYlv9OpDqF0WhY4DGU8XykVOhhHpxUknlPjaR+7rluvsbsRfrx/5U1boU0D+QgfoZI2UVj3rAGo9QytjBhTvnoAotOCt+UMXCGNqcxMusovHkyvdt4CEx7LFP0uryvldKHcr16VcIT5GQ==
X-YMail-OSG: KAaz6_QVM1kBHU2uZco_wsqAi7jFo5xWmcKcCPNresixb2SY3u904Kc1ykvsaIs
 nxF.qsCO0U66gxx1UbKo5xurKBMGLo8aQxjhwOCUn5QdD9P0vbtZHtlgZS7p9Lf9i13DX9iIxE5T
 VTfbZ0LfxnbypGJgZXTo7mo2HBsOoiB7FNp53IT91a2..x2sHnj5VFe6wgJiekoK6u2YXUuWGqdU
 9Ecpn0MvOtPCGCUDmFp0d_unJWfWmMPw.3qXO66bDtSODP9QCfrxJvkd1LOUzcYfHDigewKu3hDj
 VZbOaykz9xC1ZYX3SNwd7sHyw0Anr0KcE38BajkjVPxCbbo0w5neBBWgzNIMLuAmFnAm59DqhNe4
 LtSxR9FpCz2d74cI.3XxikUv6ugYPm2WNCoa_CLb05ZgMJa3gor_rzA.NOLJE591zZKu.U6ifTkh
 jf0MtxBSJKkfua7QgBfsGSHHzetUEFvbnFTicBvzkdO.w0H1x0m5ek4mer4i_HAGPoWXu5ISkviJ
 cnT5H5C616mCBpS6sdMFr8W3w1dsPNKBJRrkWx4Ym..nsRXELeGrYxhyoDFdDDQbeJVQZFjMFMHR
 XONE0Qqj6F7ut82kL8eSVivWZkOAlUYRN1Hl8oyCU9yb0GaxSg3P118goS_wg54.d0Y0criAPfZy
 kIlPdxUDexSGRal1JndEvJbel4jhE446uL114H1eEPkwMa6sDvLCQRO.XgyGj_s_ZwewsCsuvLf5
 _xQUhCRjzk8mGX0ASF22H3ZyJH5FiE7yGgkHRlDhghAtHbjqg0.IBZlbx8jLkvTVyZKdr0e2A2KF
 uCFqJBYgICFFGWaykyLe7Cm2Q1CYI0LGQXMFVQgT36WIW7jCT5skjy72eaxaEVm8lKGv.Npy8yNu
 E5mcDZPjoz2bKCpz5WiRxo4yMrWa2CHQjYcjXaEqCYdqosJ.Kf.__UjeReoRuJIj3o6vvQ.SirrX
 8kEqWg6AQsIkMG.tKZLcxchWmEYhaNxhJrJSpMIHdvsQhtJVWfONF8Xsl6yHhl8ESjwcICatzKZe
 TlinOjjEJzFxEqpHesm4T7rEKh.CXFHl3nwicf6HbXKzLZUNs799KpQ6.dpFHPo9aUY98rtM0bFE
 DNWpD_PaVJElMmz54kKgb.VB4ZIzE8j5Jg6pf96CSv.95Q2z9gV.1IXRaaZknv7n4bmclEyLGxLT
 gBvtNd.uBI.v5B1_6Ag0Lt8Zt51L9wYfZqYhh2vMQ4kILy2d.IHO5u0NSrSrpBem0A4Edw7f8RPi
 iyPHuhNCTs1l6uGHRFzi8cjUCNrhdmvP7hvZpTWEqrnSbdTOM3w7jA766XU73FSzXYInJ_3CB.oE
 YnAEAbhWrweM0AUisGNP1lDfUXLPsl3siEJEflU2aBXm7i6Jhf3t1Ey27L6VEmUCzAUGsKlRM4RD
 G23g8m9KR_WqGxH358n4fTmTbfn69_wuEefifqg_tS31HYYLrS2qBihhMNdff53NHMZa8ZNu3Kpp
 r071BtlBKvW3JeyLfF8lGE6gr0PRz7JuUZB4kPdxjf_lO5PyHYqgTSxH6WJK6OFgRXnEzgDyp3D6
 Joj0if13znVC8s6r4iOYtMzPGavdxYHY3zOQUyXbtJ.HYGkTksU0KjxFaWNJKcmFI2OIkcGMtKX5
 u2ApoJ_luY8GjGg6JQIUK1BOCdUHgFjQ.NyMMMjqWsP12ccC82UKCOC59O8hDZAtbC9xHXuEDi41
 QoYwYblDE1q2IKhLBteTaSmNNAafdKCwDFdqqbSoCXfAKLKSfGITpEgZQZdT7ru6PpmhcqVGbwYN
 vpc1jK9LnUjbE9bOHVGAMhRYsdZefdTJHrnMyxaI_5n5JRUOZWuxjFsO_ZoXmmWtxChLvwtodvpc
 r6rizLuvBf0yz3TTSybc9gzbtCrvK_IbR7c839gbavyn8HWQRomksw8ErNL2QrhbD37Ke1a1fuBs
 EpMhfUDfz.snQtW_LaeUxLFSrcQNy0hyvl.LsAgTQ2kotfKthFmkzu0HnP393RCoT6hriRRaRnBD
 XR_aPasIie.R2t7D9s70b9TTMFpuvpeZeIGDA6c_VtOArlGSw7sP8dWvfpCfonyIGNjUnx9e3vyB
 E8Tel2T2ZFXbQ.y4RjnUtkPhcQHaoM9tEJx3qGw5tkuZW3SqkkDsldHHAZK2G2JLiV.4SDuBTJoU
 oCU09kM.5ZEP2VSSqlyemPw2ssdpl0rxkD02Crz2koUKglxchU09A01fGz7rIC0Q5LSid2hA5YfH
 VKUxfRd55eUqWFCYBqdfMboTAEj78x.rd376Vza0ACi0tSUh6eKAagILOYnwI2ivWJ0KM2o_Gvqd
 BK0i2H3GiKMOVoBNesxiqAHrKyNos9cpnDScrQ.onF1F7k71jCWSngVM-
X-Sonic-MF: <gabemarcano@yahoo.com>
X-Sonic-ID: f5374bf2-b7d6-4127-bb62-59a299ca6892
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Fri, 28 Nov 2025 19:37:42 +0000
Received: by hermes--production-gq1-fdb64d996-b986d (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f9fa75f8bc984b6daa9104a1fc278762;
          Fri, 28 Nov 2025 19:17:24 +0000 (UTC)
From: Gabriel Marcano <gabemarcano@yahoo.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (dell-smm) Add Dell G5 5505 to fan control whitelist
Date: Fri, 28 Nov 2025 11:16:44 -0800
Message-ID: <20251128191650.6191-1-gabemarcano@yahoo.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20251128191650.6191-1-gabemarcano.ref@yahoo.com>

Allow manual PWM control on Dell G5 5505 (and SE).

Signed-off-by: Gabriel Marcano <gabemarcano@yahoo.com>
---
I tested this on my Dell G5 5505 SE, although there only seem to be
three fan speeds regardless of the actual PWM setting (off, somewhere in
the middle, and max).

 drivers/hwmon/dell-smm-hwmon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index cbe1a74a3dee..683baf361c4c 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1533,6 +1533,15 @@ static const struct i8k_fan_control_data i8k_fan_control_data[] __initconst = {
 };
 
 static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
+	{
+		.ident = "Dell G5 5505",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "G5 5505"),
+
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
+	},
 	{
 		.ident = "Dell Latitude 5480",
 		.matches = {

base-commit: 765e56e41a5af2d456ddda6cbd617b9d3295ab4e
-- 
2.52.0

