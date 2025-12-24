Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6FF31961B
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Dec 2025 11:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766574434; cv=none; b=V3olnLhZYB9qU5iAGAFmsRkh0OMrCq31bdnQ6OtT6w5SZBHat45/W7oEUH7V5zJvd00pEBXDXamxXYYJ+O3YuRmte4pMNZ9Tnc6lyRt/bc5DvsFN6ICwUdQWxolwaSCuwUSH9EDJZzuYtl6zI2MmRM8LETjlAlAw20QIhTY9zao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766574434; c=relaxed/simple;
	bh=peLDkGkfvVeq8s9OQ2Z3COfZN95ex01T0ndosnBQlxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmiRZ0BZmsXpm72Rs3LVuZFbBptdPR9UVqojUjzO3Q3aRIA6mYrkQaIKjMfbfl9lep1bJGLEDCWlA33N/zTyiGdfMQ0Qn8ySsqUQeWKXQvhkkGKSwb9W6bJYC5ZnF8A4wNaUQHaRjqwU8+pMY87SCTmebG2oesmDXmE3BSnIpGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ag5nWSt8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QRVd2ONK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ag5nWSt8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QRVd2ONK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO3wKE43796520
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Dec 2025 11:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BOoZtnG7w7Q
	NkR74zB/wGL7JB6DTBQEs5D4TYWkf6Tw=; b=Ag5nWSt8PdTpXePCU5NMmEC8llr
	WQBJD4Vh1B0ddD09bGpvp/UeMyuickIB9vB9zQKFcu6QGCJs2I7Mm7RKQPSWsLQP
	I5K7rVQT8u14rDT3o6hA1+EHjdiU817k3bidE4HXtYa2roRwZPZxZ8smLV+mdEJX
	mfJ1y+iRKRGGC60cGCpTiXv5Hih6mgAF7KmT61EY7Ao7ya16ehqjq3R9ra8CbSc/
	kb3dAooX6YoxCrkhhQNs14t1cPuny1A1iX6OEPifnesx5Qr4KR41otj5kXRkiadC
	dcYjkWnq5dq1RBzFuU8xonsHU1KfPSrDvRgThqwFMniM56TIfNTAkMM+InA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b88r690hv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Dec 2025 11:07:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b24a25cff5so1631430285a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Dec 2025 03:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766574430; x=1767179230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOoZtnG7w7QNkR74zB/wGL7JB6DTBQEs5D4TYWkf6Tw=;
        b=QRVd2ONK5dC17+r/CS6OgIDrie716jUVDPzHtxYStHmWQafTZB8otGakCU3zFG5L7b
         yUXQ7tlbDd8GaLA74X3kFdpg2MVuwgVHIUjZ1ddDZJsF+JtUGSv7Joe85zX4NTWXd0wj
         cR60k7bkbYCBkr93+t9vEsTwdQDEgVCKjKuLiFV36U8oSXi1EImNvS0xx7rw0hrY7sit
         NETmpCHcPQ8Jq9yXBzjxM7hQIFidPl7ftFie/uK92OoG3bUbt9wXokApNlNs3nV9u6mC
         4AUwO+fXrJrlmG+E2NUDtRZJKHcSTwlemr8PMOiset+sBciUH7kteiD368Eulkq/aJN2
         tmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766574430; x=1767179230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BOoZtnG7w7QNkR74zB/wGL7JB6DTBQEs5D4TYWkf6Tw=;
        b=rNPBUPyK6OwRQzdK9cxA70Dcm6WllQJT2CHm4mzsUnLNcupaUsggHuHnWi3qsQnl8W
         WiA+x2FQ1Hp+jm0tgphD2kUxUNSt90H2jzTpDDtxDyS0QhAJ5heQ9uDrZ2J//YlRHvuS
         qHIrXdKNCDYWXB9TsMGb87CTMMm9AVi+ckb7GKQK5Y8EAByDDW1Sf+RG+NaWvaP6S/Ho
         5GlkFjShSOg5FNtHmYrT244dybC+FfKsxkPFu5Rdrq+5ebhOlGrvIQh8gFuPLV4g66zj
         n37ztiBtENmMBnFzPeIdVu5Y/rZZTm3nSmXgHVmf8hWS3ez6Eys9FMahEVoV6Pqcpp4W
         t1sw==
X-Forwarded-Encrypted: i=1; AJvYcCXiJ1DLXGZbXYW9fZvAafyO1GBwI3YJG4bkx7HYPvjDlqtjB49izQ4AgKl8EdquRJSjv35BZ4XrIHn4xg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUb1IZc+edxD+JJ3+wThbfOwbb63KcqICg447V2RX4n1LgOFFu
	xob9Lo78newCKIBwprO+IYXUe0lqWTBU8g6Kyyaa/ZUg33RY58RjH6qDrlBUCcAOuKs3it/K19/
	49jsGGI8oLKlnbDO5pa+IU//iZb0Mm9enofisJSrMelyQyigJqbRHMV7gw91/uPPITQ==
X-Gm-Gg: AY/fxX58ns6Jhj2LOCQouj7ugJIa6T/F9GUMnFAKS7PqluXL3HEq/f3UAOHJ5t+QTR/
	DcV8S9owFoRiNn9s8wlF7tqdjYA3wJxwIuoasBaPY4dJCZYg/p5SRiJryVsUHkGm2j7qPuSRvo9
	qmKM3mGjEOXhtsZHlGrohNaIMR4xgqChc/m2aCQDKNfuzfPe0mZfjL6fZL63RyCca1PIhOPkfNi
	J9JcqRrhC3wOKu9JRAKMghDbNr8wiAce96hdaek37FKXxkq6+0ln/Vk4AVCRmTKPrj/jXfy8PMM
	F426FDEItt3n3dagbJAYGhdQwy+gyw2i4gacLvqiAdGx1VnoKwggUC5zFjkMYQPt36WIYmbWEy7
	GAjovN/GioYBgzLqf9JTq4QU1RHJ/BfGh/Pk+42XhvsSDmjMatx9BSC5LrYnwFke3gd6IKg==
X-Received: by 2002:ac8:5e0d:0:b0:4f1:ab7c:e3f8 with SMTP id d75a77b69052e-4f4abcf14afmr239556241cf.25.1766574430607;
        Wed, 24 Dec 2025 03:07:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELuqeKBNJ8YoVfbtdSIMB+JL56gmDqI7JndViBtJou8EBAlaHxhmDoB/bwIt17ieYQ4Qv+bw==
X-Received: by 2002:ac8:5e0d:0:b0:4f1:ab7c:e3f8 with SMTP id d75a77b69052e-4f4abcf14afmr239555931cf.25.1766574430249;
        Wed, 24 Dec 2025 03:07:10 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6ebsm16320374a12.27.2025.12.24.03.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:07:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Ban Feng <kcfeng0@nuvoton.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] hwmon: (max6639) Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:07:04 +0100
Message-ID: <20251224110702.61746-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224110702.61746-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224110702.61746-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=peLDkGkfvVeq8s9OQ2Z3COfZN95ex01T0ndosnBQlxc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS8lXk0DLZF47Mhuj1WB3GB/6JRo1oiFCM8m2d
 ovujh2cKuGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvJVwAKCRDBN2bmhouD
 1zbED/wPMyOkXxZTRYlqNmpWQeWFwA4fWf5gVloS+GflFNnRhv17H0BmbqrhFCAFPV5sXM2Lfel
 PnFI3a+Pkhx5jblr5/n6hgGN5jfpY/18eFWbAkEmifXhWUHIYP/JqKrbleK95xnxzV3wO+WrFeU
 hfnEwYiTLeGaPaJITs19E3y4ZOPYGfyr20X0S8wOzUPobF7tcZL0VSfJKMfFKyaGr8GptDLtXya
 VeL3yl9VrYz7acK8y68ShrS2sEcaCoIjAH8JzlvFK5wy77pUuzAXVDdM0sfpRVHriF8NrwG3np1
 lJfRg4Qi6ObKUuZ7VR9v25j91V8s00OpWwn1Ubs2jI+j2rlqc7phQOfByXWYRl3pKpQ+jFNNWSV
 o881IHZ1g8vk4WXMYUFYLzT+6rCpqOvVq5qKIjIXlN5b3Q0fyVfS73QtRZ4g2Zpjm0El5PnMW5U
 bJZaJguMgbVNu5IfPzDct1SiMtLbIO+lgBRIt+NDqq91dqYyDGpoM6CDc3yrDPT0K4N5NZJFTDr
 KIjySiCCdo6UMnkVYAEF1z8Qi9Yg7Li/LLDSki42QzkwpaQBPRT9xARv37UXezqZH03ivcNWi7j
 QOrEzDD+K6FjOH0FhaaGHeT2ybeMQgPQsYBo21F2/01I8AqEQ3xP2CU2QIlp1UpCHYfDyIEBiwu v3fHUbq9oXIPb9g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BwpyOrY4fW5xyq6yNVdDfzj6LVKBvI8x
X-Proofpoint-ORIG-GUID: BwpyOrY4fW5xyq6yNVdDfzj6LVKBvI8x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NiBTYWx0ZWRfXw1cOc9KIqigV
 vd/PKpodEjOmldjbHxS+5al0crbx0MGiPnccI50nfkQy/hbbbddsBprojs/G0/shUwZqgpJZ0Yv
 GjWq0DnT2YeklnG/9eoskBnTond6ckmnH1pqR8c2ohqxS/h/t42PtiO7FCd58RdLIi4FPMMdUXP
 /C94Sgcylx3ewwUt9vIallh4QphKrX0NBIVHjrUNbNM3us1q0dyzInjPOt8y/8QZyfT+5vlYeev
 nKd3fYW1Xd/vqm+LzpaoJ1M1NTauNb+k/ONCkGgy0n8wOh8LjSrbKWzeThKs+Yt3jWGYJLgmin9
 bvTKOq8QqiRUDecjyY5W6uuQrMFzsOwklRE/EMkFOHMzEdhBh3cIXdUtlHFC6DO6C+iX6HyVT+j
 28VcoWj7V7JD1zbyztjC0NNEZtJwSCm9MC1ZgSVYWxDUlSpwXvq+olmowlEAObLJ3qKxxYLl70g
 PFATVz07BApEDtC5g2Q==
X-Authority-Analysis: v=2.4 cv=Qahrf8bv c=1 sm=1 tr=0 ts=694bc95f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HrtE2ikmbAnLTK5GHhcA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240096

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/hwmon/max6639.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
index 99140a2ca995..a0a1dbbda887 100644
--- a/drivers/hwmon/max6639.c
+++ b/drivers/hwmon/max6639.c
@@ -563,7 +563,6 @@ static int max6639_init_client(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	const struct device_node *np = dev->of_node;
-	struct device_node *child;
 	int i, err;
 	u8 target_duty;
 
@@ -582,15 +581,13 @@ static int max6639_init_client(struct i2c_client *client,
 	data->target_rpm[0] = 4000;
 	data->target_rpm[1] = 4000;
 
-	for_each_child_of_node(np, child) {
+	for_each_child_of_node_scoped(np, child) {
 		if (strcmp(child->name, "fan"))
 			continue;
 
 		err = max6639_probe_child_from_dt(client, child, data);
-		if (err) {
-			of_node_put(child);
+		if (err)
 			return err;
-		}
 	}
 
 	for (i = 0; i < MAX6639_NUM_CHANNELS; i++) {
-- 
2.51.0

