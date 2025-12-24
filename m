Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12D331A57A
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Dec 2025 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766574432; cv=none; b=Zb9t0ADVa/QkNLc8pMDGpWlHYB0jL/moJrSg1r+2KTW8Oh6b44ARzUpjx1ZdYAl7ZZ201AaNDAF6jcJCdK5sXly1T0AVoVIiISCP4OAKY6T22V0U97SbYziUzdXFSP6HpToPYFC8rJugjqZD1aiQf7THRgQ7JBsaTihlkZdp/94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766574432; c=relaxed/simple;
	bh=T/kSWXMdwUACcF8NTGvv3IkS9C8rfMLfzv6gkYKOVRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qyUdfB0zZSgrspDCF2j3TQuIAQO0ONTZNk+NkhfyV2G0R2Wxs2roBrOT32MBBeCjx3SUa6NrG6bMCH8htY0ThPp0sW5lwV02tq5AaDAK5X813M/U6EgpdyGuPeA8seSaLUvzLiN/FMGNpBUGSvbRBfBY8vFW5bBOrqM+75B2kE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JQiOOlRs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dD9B3Q/E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JQiOOlRs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dD9B3Q/E"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3mj2t4134198
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Dec 2025 11:07:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zEsPKO0LPc/TkegK+om4Uv6/04Gy4ry1N/W
	6h9VBoLI=; b=JQiOOlRsL/91dsV5zII/nrXo5d6bQSAe09mREKsVHP9aGp8E7vQ
	szFFbcQnNLHChVxJKfwetKm9MjLv40eJCO9sEjhhe/zWfbSAxe1AxEAse9xEwodT
	jRhQFWU/PrAJbr7Tlsi3O+Jxdk8hO+uZ/iRkoKZSXyI5pVfsmyA4+BG8wqF2rjxq
	MaHQH/SNc+rPkB7JFwOspgYaUNI2vLjGzMUy+hq/lKGhEjAgsi3GVZLv67tMOgqm
	8K62NaCWZZPYru++gHubAFrRL4B1oLvLBQng9dcTDH71kyqfltY4PxyIY1jP2XaH
	wpsFRd6rZJzKIfvPpuW6m1SNJk62BiWL05Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7x46tuyc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Dec 2025 11:07:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee09211413so145844721cf.2
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Dec 2025 03:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766574429; x=1767179229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEsPKO0LPc/TkegK+om4Uv6/04Gy4ry1N/W6h9VBoLI=;
        b=dD9B3Q/EVx9RlXQ0nNiBKTsE4/EcakYFvSsnH2UGY7s8RqUP0+T01xx48MEIPd5en0
         awHe+dQXwhXJvVH/HG8JzMJqGkWCzweH3f+lqBZkWRJLdn6CaF8YBmYi40VriFLHkb2I
         iti0sMyaUhe3UaEUnnPMXdFJd3VuxYEtamXkH8zWqlbqHS6edLEF8NSoti0XBl5OFuKK
         WFfP0L1bRe1fu/6AkGK7VI1EhRXCDm8KNOUfBsoJSYZVAiiOwKIQYbH/c2PAU/y6pnMG
         weKuop5ZSV1rZ/wtRE3DtL77GIKYpAFbj94lETIiSOutmyWqbgWLuLuu6momjHGgKo1r
         51tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766574429; x=1767179229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEsPKO0LPc/TkegK+om4Uv6/04Gy4ry1N/W6h9VBoLI=;
        b=YcChrbachLdCtuo+LRz5XidHX7mYt7zbqMG3aA4qGRfUPIfBrzr4Yqy7LsmBykErkO
         Ro0kgl8MbZjHuFtOfA/2wPe0L6ZVEagSHBlwC9bhJOfdaOsSC1TZjKYiBFX5zjtXwGfb
         rwlP5WfWHz1L8bsio2qr6MZk+rFxdORGITAKQEtbi2lPx6jqKaCjS/IdFx6pvFHh8RgU
         xGJK8+7O7jTP3NQ6/UQTq8ZM72QiNwL6E+n5eTTFdN43qXlrv904B72Q1kIW649Ybj1m
         vkTpn5wMbTJtDhsCLphd+6mVv2c7jZeE9b1Uf3Hi1pR2BrMkorhAThGFjPqUC9MSjzfY
         NauQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5yhGeeGzFtNzO6mcT2kAZN2/Dqnp/z0+VTge5NCvwF23hU/xHJSSZYWQ9wCmSK15wKieB4C74n3Wvmg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpy5WlOh+VJyMfzn4kZIL01nRB9NYIoUWxTLIZOhuPaMV2F31D
	g+0Jur3NGSuKR9bw9NdN2sp7Q0Me0XQGlpIb7P9jids2p2JVR6JvXVQFi8ciJbqzMp1AIcn/5E6
	D0fL0mfePkItMExkVPLD5biDvvO4MMEZRz1jUWT1p0fnsBd0PywDfuBeYqTj4vNNVlA==
X-Gm-Gg: AY/fxX5Pkwe4qL1Svo6Bw298rydmM6dXlOuczPecOeILboRHk0kRZwXogPZDPP/XEkZ
	An1Wu9Ul1SHGSey0OhnG2LBVO5L5Fu1plY0c2aYxyswa7TnHBPQnRLZiDNtzpChVtFITa8jToJT
	16ZfGUywpJpjbr3hlrURJBFQHDK92Ke8y1RrvUgwr2MdxzZwdpMUd4HAR/IHt9S6j6MIdhD8bpC
	bHvKOtBPMC9gl+gGulj/87S92kP60K+b+bDaqMoXzAScC6Raks3LgT+rneYTl9ZXLK329vss2Vj
	v5ERliMkpPC9JjEhp9fbap2N2AOFSm2Iw86DBee5NFlfEwRcRyBpPmXBeCd7ZAFLL/PlYJ61S8d
	mrVKo/tVoRxUpZ2mGnjdhNJGhpY7BLZGnXn8cpHlFXcG9uMT6FRRM0QCngFJotSGjZrJN2g==
X-Received: by 2002:a05:622a:247:b0:4f1:b9b3:9c2c with SMTP id d75a77b69052e-4f4abcf142cmr267193151cf.24.1766574428706;
        Wed, 24 Dec 2025 03:07:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaVG9hQI2pOsdhgJBZNQKfH3aVEEwGBq3bNfyd9vF1YcMNwgXIud0i2uAcivPQZhnXj+E+dQ==
X-Received: by 2002:a05:622a:247:b0:4f1:b9b3:9c2c with SMTP id d75a77b69052e-4f4abcf142cmr267192781cf.24.1766574428192;
        Wed, 24 Dec 2025 03:07:08 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6ebsm16320374a12.27.2025.12.24.03.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:07:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Ban Feng <kcfeng0@nuvoton.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] hwmon: (emc2305) Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:07:03 +0100
Message-ID: <20251224110702.61746-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1179; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=T/kSWXMdwUACcF8NTGvv3IkS9C8rfMLfzv6gkYKOVRw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS8lWNowqSJQU2xSAiWuXEtCI/FxnmxDxyNV1n
 pkreKNtnseJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvJVgAKCRDBN2bmhouD
 18fQD/9lWv3Pa+m5cUUC4WbeQON9nBLe7dludCWFhzIX5O6HHP6jV8SflXn5dICcP4e4j99KizS
 i4NuT188XsQsnqJSJdxdhn14dyEY5D39IDaZ7k85Du1dCRmDDqiQpzt/Zm9rRMtrnz41eECg/AH
 JoXQwbWfSrI6BPyc0rvWx2ggUX3bRoTXyFyt/6adcVOlm9kO0bZ/UEuB5b9Jve7ud9G94y6QLKo
 dZ316HbWYhOCO6NCKzHqG/MzWegz5QH8ATbgPbW1wPN+W+bx8QFvGgXSF3+hsFpX3ZNX85Mt8uC
 Mo7/5UnBzV3iwB4am6fKoezXntaOK2TSt7r4b/IU5lzxedodlI1RI49MUEu7kAkUHy73xMBtA8+
 7eOorr6cSzQO5Kl4lk2AHNwjIyHbxIE25OSCo5niiSmpMP5LdnifLVHSovY2HOhBhuQq8EEIFP2
 vCbXXeoq002ukUzZ+gakguU9Os36HuKwBr+70qtBSYiTX+/x88avjJeZL53SUtErgcz99vd+OXc
 BTfASl1Zb0CFmKXvffnO0Np6+Xv41vJVHs/gQqIv1ffg0hH79MACGe3UVP4x+DQ2tDjxJyWFKYk
 HbHfG2kJNqwjlIkMjx/q66nGRlIBeVllW//BNg+CrA+Kg/v88TvpMFu1hsuK2Jkfvxx3+EdQviK mLszWutxzMIEUIQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OVHa27131NvGeK0ziiHOjDCkrbYNmgO3
X-Proofpoint-GUID: OVHa27131NvGeK0ziiHOjDCkrbYNmgO3
X-Authority-Analysis: v=2.4 cv=aOf9aL9m c=1 sm=1 tr=0 ts=694bc95d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qnZC1CmG9Ofow0crzBUA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NiBTYWx0ZWRfXw2cfgA+bbXA3
 fqSvytWlsTcFxNRmhE/yeuduya0X97uKKU8l1OEvPyO99l4WUqE37XOMearyZF/HONYtQA7j+wA
 +404GavabTMxGEkmMT5CL1/U8Wk78fuACOHNrEshoJwC1QY4rUl8/SXZnFTF6kbI7/xpn6tXzCP
 2zYQsYTxjDhaDtsGgcNcHLN+U6GLoxHytnPqjd7P3HYlvp7li8SDD+XEOmfAiwpa8tqio69Mn3J
 gkbVA83F5TzuLudU60XjpBfQyHZxR+UYtSAcGKxuL3IIkal2wnt7ZeZp0kp0kGA3rIsZlC/h1oQ
 0ilWTP+cvSi4P3Bfu42YJwHDi2nzF8XObN0qpw+Kmy6eSUu9hY6LvCMhhmCSVC4iYMtFwF3IZuj
 dwDXLkBc97jT1M9UxCb0hlfuboiD1ZJct/BZe1zx/Df9Yl7EGn2kPaiWvQKhGFmyfHJpeCqdptT
 Tpm8UdNdd/peo0SExvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 suspectscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240096

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/hwmon/emc2305.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index ceae96c07ac4..8f80a39574f3 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -605,7 +605,6 @@ static int emc2305_probe(struct i2c_client *client)
 {
 	struct i2c_adapter *adapter = client->adapter;
 	struct device *dev = &client->dev;
-	struct device_node *child;
 	struct emc2305_data *data;
 	struct emc2305_platform_data *pdata;
 	int vendor;
@@ -681,12 +680,10 @@ static int emc2305_probe(struct i2c_client *client)
 		/* Parse and check for the available PWM child nodes */
 		if (pwm_childs > 0) {
 			i = 0;
-			for_each_child_of_node(dev->of_node, child) {
+			for_each_child_of_node_scoped(dev->of_node, child) {
 				ret = emc2305_set_single_tz(dev, child, i);
-				if (ret != 0) {
-					of_node_put(child);
+				if (ret != 0)
 					return ret;
-				}
 				i++;
 			}
 		} else {
-- 
2.51.0

