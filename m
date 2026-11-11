Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.148.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388439;
	b=e4cUl7+SGXVb06FAwrn0x0t47SKPqsmTmN8I6uFH54gh38oKiwSIccM1FumVzeEIzM5V
	 mGPk/BzBnEQAv1MkkHygaqa4l/QAMr+vkJ9uxB0yNXBC4uPocUZ8YTn96Of24mMApWgkh
	 PwicYR5Qz32WtLeiJ/1Zhl9nS1n0ZT4IP9CEPwbpMBwFk7m0wmTBnNzK81Q+cByD3PBTe
	 VsKa99sC/RIL+RCjuBiTd/+oWywbjOQ8YON7K4EuwjhwT3d1DQx2Jfk0t/00DMEFA2mDF
	 pRJE27ISS+8rqjccunNl85l66CXY5pU0UHRHlyQCivPvBB3Xzbey5SAw61u+hSMmY7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388439;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MTbFAI6NVXLiSrLzqsZGhXMlB3ifXszOLdZCiOB8Kek=;
	b=OFx92IXWv1NLjuCSPdybcVm6nZhyjJ80sx5i86YZ53LggaJiyiPuSWfvPhsqcZgjAA6L
	 uU+1XYorlLJLMtU6PtAqq89WykEhJwKO03vLEPEEBki8Flv11RAOLMUk1ttc8pOypBcSe
	 IojWEBAZXa+9jUS9M6C3fn+DNreA8NZhcFQ4oWjRxPIkiI+fza4t+oE7Roc7Cj33EJy4Q
	 D7StIJsQ7l0+tAyknuOa/WamUPYdGubw7Nu7ai2R5m5bO/wu1meQj+8lc5+bKuK/2olCS
	 +C2mbwSUnAcOZkO7OB/Aamonz6djDgixabaPqa4nxcvww/g7vA48dMWD28oH2IdfQ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lenovo.com;
	spf=pass smtp.mailfrom=lenovo.com;
	dkim=pass header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=doPxCkFs;
	arc=none smtp.remote-ip=148.163.148.104
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF7A606A32A
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 09:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DF7A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=doPxCkFs
Received: from pps.filterd (m0355085.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5Mrcn364371;
	Wed, 11 Nov 2026 09:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=MTbFAI6NVX
	LiSrLzqsZGhXMlB3ifXszOLdZCiOB8Kek=; b=doPxCkFsQNSf2IVH89aEFiNJgO
	crr1qQOfkM64+F9x0FEuKQrcscJ8Jd1h4mQcXYLl/T1C3ouSociXoMfrXlyqdN3v
	+ega0S5H/ntWLnGI8BOGXEG5vAYOm0sDE7bimiPpx21jg99AE2lmaeV+i/G0TFOv
	Oq1BFnbp2M5MyUlAxmUBaEQX7j9p1QQyOT5N0EikHSVv/CFqR2zB5aPZ0luSWcx9
	gtwJXkmz+bvZtsYQ9NaT1Z13ZtDaU33S6km8scTIjZavcZIMfFnoCymvElSdbDNg
	6XAPtfbwGYdHJzpG66O8jlJR87dv9O5B5j4GrEAt0FnpzPl/Ytq0u+SI1D0A==
Received: from hkglppfpool4.lenovo.com ([103.30.235.221])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4htjgg5dkj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 09:13:41 +0000 (GMT)
Received: from shelppfpol2.lenovo.com (unknown [10.122.146.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool4.lenovo.com (Postfix) with ESMTPS id 4jPd9b4H5HzltBHl;
	Wed, 11 Nov 2026 09:13:39 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol2.lenovo.com (Postfix) with ESMTPS id 4jPd9Z64H5z4yH0;
	Wed, 11 Nov 2026 09:13:38 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, jdelvare@suse.com, lijq9@lenovo.com
Subject: [PATCH v1 1/2] hwmon: nct6683: Add support for NCT6801D
Date: Wed, 11 Nov 2026 17:13:37 +0800
Message-ID: <20261111091338.799889-2-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111091338.799889-1-lijq9@lenovo.com>
References: <20261111091338.799889-1-lijq9@lenovo.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX82KSawXmplwE
 TwuRPfucxDuK2eoiJrU3mgWWxAbSLaHypE/cYCluwd9Azjb7Whs2TsI1mzin20ZGfjdWvvkKw2b
 XykfNmWUuGWMuQRj9yP9fDl56H+dzUVnv2E/3E5BvGDdFFNell8USSfP+D48zMw4XVAlKSj/cS2
 lnlwa26lLjZZQrTIbVmhDqwNNiY0e+otJWAWghwEpF+p3ez/MmTXD1bcWs1eyI0yfsfaXKHC9rA
 wkqbQ4h2qc2Rt40nPoySMTunXzvl2pcwOnIivWRLDBX+8mmRwsvTkiR4ekwMSmK49p2cjMI3rsO
 GH17lqt4Q5ezW1kKffTqEHxUuP92sj+ROU4stdYs3pSR89cXgA0eEwZ3IWyqeJwECfYFd3Ercst
 frRim0y6UVcZuOP/ql9iL9Iit5NGUdHwvz0s1Jl90AfYIe267fUozkcT8ZAlXhiu5aE9MCJs1JG
 Olbpe8Y2ZSI0p2AtFIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX/kzN6E8BcJUb
 n+K2zVtwYrZSn1Q2mp748z51SS9kzFGc3X8vlLyXmhZzeT0qWcHIfPGDw4wAYKm/OfVvF0zAzRR
 Dlri3zxiY24tCd7t7YH55vkvV11lt2M=
X-Authority-Analysis: v=2.4 cv=S8dMU4sP c=1 sm=1 tr=0 ts=6af431c5 cx=c_pps
 a=kYoHdcNGVJUooFJAQZl1vA==:117 a=kYoHdcNGVJUooFJAQZl1vA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ohM_6DErYqYCNn4jCPz8:22 a=8k6WQxmsAAAA:8 a=_jlGtV7tAAAA:8
 a=Q4f4o5kGi-PjBva4cGsA:9 a=nlm17XC03S6CtCLSeiRr:22
X-Proofpoint-GUID: IuhRxvMXibBKw0iZ2tUD5jaDThfspcXs
X-Proofpoint-ORIG-GUID: IuhRxvMXibBKw0iZ2tUD5jaDThfspcXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110036

Add support for the Nuvoton NCT6801D embedded controller used in the
Lenovo P3 TWR G2.

The NCT6801D reports 0x0113 in the Super-I/O ID registers (20h/21h).
Unlike the existing chips, the device variant is encoded in the lower
nibble of that ID, which SIO_ID_MASK clears. Compare the full 16-bit
value so the chip is actually matched.

While here, also reject a fully unset base address (0xffff). Without
this the driver would happily register a platform device at 0xfff8
(0xffff masked by IOREGION_ALIGNMENT) and expose bogus sensor values.

Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
 drivers/hwmon/nct6683.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index e1c36c95affb..42ad2c175de3 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * nct6683 - Driver for the hardware monitoring functionality of
- *	     Nuvoton NCT6683D/NCT6686D/NCT6687D eSIO
+ *	     Nuvoton NCT6683D/NCT6686D/NCT6687D/NCT6801D eSIO
  *
  * Copyright (C) 2013  Guenter Roeck <linux@roeck-us.net>
  *
@@ -14,6 +14,7 @@
  * nct6683d     21(1)   16      8       32(1) 0xc730
  * nct6686d     21(1)   16      8       32(1) 0xd440
  * nct6687d     21(1)   16      8       32(1) 0xd590
+ * nct6801d     21(1)   16      8       32(1) 0x0113
  *
  * Notes:
  *	(1) Total number of vin and temp inputs is 32.
@@ -34,7 +35,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-enum kinds { nct6683, nct6686, nct6687 };
+enum kinds { nct6683, nct6686, nct6687, nct6801 };
 
 static bool force;
 module_param(force, bool, 0);
@@ -44,12 +45,14 @@ static const char * const nct6683_device_names[] = {
 	"nct6683",
 	"nct6686",
 	"nct6687",
+	"nct6801",
 };
 
 static const char * const nct6683_chip_names[] = {
 	"NCT6683D",
 	"NCT6686D",
 	"NCT6687D",
+	"NCT6801D",
 };
 
 #define DRVNAME "nct6683"
@@ -71,6 +74,7 @@ static const char * const nct6683_chip_names[] = {
 #define SIO_NCT6683_ID		0xc730
 #define SIO_NCT6686_ID		0xd440
 #define SIO_NCT6687_ID		0xd590
+#define SIO_NCT6801_ID		0x0113
 #define SIO_ID_MASK		0xFFF0
 
 static inline void
@@ -1394,6 +1398,17 @@ static int __init nct6683_find(int sioaddr, struct nct6683_sio_data *sio_data)
 		sio_data->kind = nct6687;
 		break;
 	default:
+		/*
+		 * The NCT6801D reports its device variant in the lower
+		 * nibble of the ID register, which SIO_ID_MASK clears, so
+		 * it cannot be a labelled case above. Only the switch
+		 * expression is masked: val still holds the value read
+		 * from the register.
+		 */
+		if (val == SIO_NCT6801_ID) {
+			sio_data->kind = nct6801;
+			break;
+		}
 		if (val != 0xffff)
 			pr_debug("unsupported chip ID: 0x%04x\n", val);
 		goto fail;
@@ -1404,7 +1419,7 @@ static int __init nct6683_find(int sioaddr, struct nct6683_sio_data *sio_data)
 	val = (superio_inb(sioaddr, SIO_REG_ADDR) << 8)
 	    | superio_inb(sioaddr, SIO_REG_ADDR + 1);
 	addr = val & IOREGION_ALIGNMENT;
-	if (addr == 0) {
+	if (addr == 0 || val == 0xffff) {
 		pr_err("EC base I/O port unconfigured\n");
 		goto fail;
 	}
-- 
2.43.0

