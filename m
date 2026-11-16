Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.148.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830673;
	b=XX2MtkazRqNZx95UB3KmXKW4zg8ZpA6N/ATDzXHZUrMyQ1rZxwsB3QIQAXno5uXdux2F
	 zizmj435tGBJzbD+PWg2PQyh4J5Wc/3J2eSj5tea0kiO2sjMlqZaHoeCLsMI6AzjRlJ/3
	 OK/LBMASC8lZkI/lAyXOuCOiAw135yMRBsnUX8WXxxw1lBawWF28qyST0cSun09hH5idU
	 FKHPhUpw9bFjMkgcsjXhFpCK+CqlsAM6qfODhb9EtLiuQy24A6Sh56hjLWdRLDgngGck/
	 E/tHRyuTe4avTPvqV9dSnAFN6dmlC4DfCg824aqPe6R/fLJoisxAKzyg7j5bcxdiPSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oICyrdTRoRmbG34xb7XeCUifm0/udjBawBRlheW0/30=;
	b=AvgwTrXSbE7nJxKhPv+043T4+Ti6wUoZ4JGVdYecCvUJCN4oHnNFkkKN3qCTjlZ95rHt
	 hJ2a3uQeR5XnWmx19KoolJdrEFPoBUTiyvr5rynzNJuJhe1oF+SMJr43iuS7W/jReii3y
	 kU7Vmwi7PsZXTuPDsqNN+eak/Cp8tWzu3oD9ShhXS3tqH99yX3P4mM1+TojNc0go4m89N
	 44eljzRwUA5iK2idVNngrXcudFlftshDR+JCVqfEuakROcS2Ja2UeCsvHep0V9Ae32qim
	 VC7VuLD5vsFJzzn7ksp39s/wSJYDkrxIozQEOnsXQrzrIyfAxRnxS33M9zAkDtEeNPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lenovo.com;
	spf=pass smtp.mailfrom=lenovo.com;
	dkim=pass header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=pFnN48+E;
	arc=none smtp.remote-ip=148.163.148.104
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAF5606A32F
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 12:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EAF5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=pFnN48+E
Received: from pps.filterd (m0355085.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0V8c641801;
	Mon, 16 Nov 2026 12:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=oICyrdTRoR
	mbG34xb7XeCUifm0/udjBawBRlheW0/30=; b=pFnN48+EcB4+kRoqMsW5GnbTQ+
	sPKTkiTHD4xrhc0QC2ySjJRYwTAjPwQ9lGNBYHYDkLNzCGKKdr30nUZNHKu7nXAy
	yqcPhDdMoJjquh/sM/di680Ugx5lCCfkkICAlhG2Keo9DFdlcXbDOa8YDBdDqivC
	iERoXcQpmI8CVd7azy55gOabvFTD/J7yWf38oBq9HTsBmfLjPrTsjtYWIqTRqlSG
	1ATesoz00yORzHBbk8sfG2z7QzKtoiezUY60nwZXVMf9r1APOIXw3w1bA9uDywU+
	FO3me23csKk25eUOhLSfQv49v37qIfbYxzNgpOP5A8dcCO3WpnU+dyoWndSA==
Received: from hkglppfpool3.lenovo.com ([103.30.235.220])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4hy65dhvt9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 12:04:14 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool3.lenovo.com (Postfix) with ESMTPS id 4jSmcg34fQzDSWYf;
	Mon, 16 Nov 2026 11:59:31 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4jSmk41xWnz18W8ng;
	Mon, 16 Nov 2026 12:04:11 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, jdelvare@suse.com, lijq9@lenovo.com
Subject: [PATCH v3 2/2] hwmon: Document the lenovo-shm-sensors driver
Date: Mon, 16 Nov 2026 20:04:11 +0800
Message-ID: <20261116120411.994284-3-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116120411.994284-1-lijq9@lenovo.com>
References: <20261116120411.994284-1-lijq9@lenovo.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NyBTYWx0ZWRfX7CcoXIHN+nJr
 //OS1vsIquj/0pN3rJg+GZusOMQ0la1HlXV5YYLnCnL8ceFjdGHe5tbHNXawu7e+IMTkxql87WO
 qOPmuxG7Bpnz40tIgTYv3WRV+T4AZhFNqLiuPXvJ4g7Rx/OCcABe7Rh7KUHYW/MXw6cmQ7SFFeK
 Dh5M5DJeW6O2V3eCQRA3ipmzA+yenFokb3ckWMHm3Jp2GnKX21OxJwRKh1yt8FvLc+76oHjVcqd
 Xf/njwS5pXzWobnwAkcUvjupyCyn1jhx+uzh7mjDyQ11dnWrLPbifG6pEPoFVOHktr8H7DGA4So
 5Slzu5z3H24GQAKhEd8SylFhh5Dz7uYGdYRO9CELeA4mqWc5oYicLTyEFB2Vid/nQ0zL/lJcGYm
 xObIVzmUtTiMuY65HVI+cH6485J6cppWbyQSMXvJ5qF/k8wSERB6kxV3RuOk7p5YOR/ODqrAADU
 BEaGqN//kwkM148ym9g==
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afaf13e cx=c_pps
 a=3okn395cuUlJnlrAQteHYA==:117 a=3okn395cuUlJnlrAQteHYA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=ohM_6DErYqYCNn4jCPz8:22 a=8k6WQxmsAAAA:8 a=oEGHd00bvgyCS4u_Rc0A:9
X-Proofpoint-ORIG-GUID: 3yfitQVCFpTvD0v9drBdGdNwcbRs23B4
X-Proofpoint-GUID: 3yfitQVCFpTvD0v9drBdGdNwcbRs23B4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NyBTYWx0ZWRfX2BLnJYXg5/Fe
 tf5gEFRTuyeXM2wXwvUg3wniuoTliUAJq5tXm0xZ9Oh5cZSl1OKr/o27c5sQlQJ5eFVooLAQtP8
 N+L7AJ2u1s3+cIgcwVdSc/QuFJwB4oI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160047

Describe the Lenovo EC shared-memory window driver: which systems carry
it, how the window is located through the SHAW registers, which
attributes are exposed and in what units, and why the driver refuses to
bind when the ACPI sensor interface is enabled.

Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
Changes in v3:
- New patch, documentation split out of the driver patch
---
 Documentation/hwmon/index.rst              |  1 +
 Documentation/hwmon/lenovo-shm-sensors.rst | 58 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/hwmon/lenovo-shm-sensors.rst

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 199ca79621e9..aba5713921a2 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -120,6 +120,7 @@ Hardware Monitoring Kernel Drivers
    kfan
    lan966x
    lattepanda-sigma-ec
+   lenovo-shm-sensors
    lineage-pem
    lm25066
    lm63
diff --git a/Documentation/hwmon/lenovo-shm-sensors.rst b/Documentation/hwmon/lenovo-shm-sensors.rst
new file mode 100644
index 000000000000..d4534398ddaa
--- /dev/null
+++ b/Documentation/hwmon/lenovo-shm-sensors.rst
@@ -0,0 +1,58 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Kernel driver lenovo-shm-sensors
+================================
+
+Supported systems:
+
+  * Lenovo ThinkStation P3 TWR (DMI board name ``106F``)
+
+Author: Jiqi Li <lijq9@lenovo.com>
+
+Description
+-----------
+
+This driver supports the fan and temperature sensors that the Nuvoton
+NCT6801D embedded controller publishes in one of its shared-memory
+windows, as found on some Lenovo systems.
+
+The controller has no hardware monitor logical device: LDN 0Bh is the
+ATXPGD/BEEP/DDR4 block, so the eSIO register window used by the nct6683
+driver does not exist on this part. The EC firmware writes the sensor
+values into a shared-memory window instead, mapped by the platform
+firmware and reachable through logical device 0Fh.
+
+The layout inside the window is defined by the platform firmware rather
+than by the controller, and therefore differs between machines. The
+driver selects a layout by DMI and then checks that the candidate window
+holds plausible sensor data before exposing it, so a machine whose
+firmware lays the window out differently reports no sensors rather than
+incorrect ones.
+
+Sysfs interface
+---------------
+
+``/sys/class/hwmon/hwmon[X]``, where ``[X]`` is an arbitrary number
+assigned by the kernel.
+
+======================= ======= =====================================
+Name                    Perm    Description
+======================= ======= =====================================
+``fan[1-10]_input``     RO      Fan speed in RPM.
+``fan[1-10]_label``     RO      Fan label, when the layout names it.
+``temp[1-5]_input``     RO      Temperature in millidegrees Celsius.
+``temp[1-5]_label``     RO      Temperature label.
+======================= ======= =====================================
+
+A fan channel reading ``0xffff`` and a temperature channel reading
+``0xff`` are reported as unavailable rather than as a value. A fan
+reading of 0 RPM means the fan is stopped or not connected.
+
+Notes
+-----
+
+The ACPI firmware on these systems also defines methods that read the
+same window under a mutex. Those methods are gated by a flag in the
+BIOS-controlled WMIM region. While the flag is clear the driver reads
+the window directly; if it reports that ACPI has the sensor interface
+enabled, the driver refuses to bind.
-- 
2.43.0

