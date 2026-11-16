Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.148.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830673;
	b=UiqQhgq9IjNHrGcsAvh4dyBsMO604jGCGe86mQDs2TBd3r6OMckkXQHyKnU+wTs29wWR
	 9rClza7xH2VaGAW7JGF9so+VYTjEefcaF8QLwPi3g8RwbLBt03Nh1XQzViQPQeM8QAmSx
	 PA80kQXs6C78GAfprQwQKoPye6U6F/9gdvEGFfvRMN/LQpriBA0nHWCQeEuycSVpATWjq
	 tCqQMrU6MD9YdeiJf+dfM96r8/lBuzHfrL9XFOnnK83YaEBbr0b6E549iA1GalY14cR4d
	 1XOytg/jo5zC0AhgeFUrBI2nRv9CWlJYb40C3L4I3nph77pBgvBJMobH/47XHIjjV6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=28uFzmtH4lf9iuyVjWJFKH1Qlf/3r3oCgikfBVUhpug=;
	b=iQu8imj6NrSQfHZa2VaZnaRxN/NCjClgpgYyUc4UU2SxgC8abHO+vNvev09PqH+Cghwt
	 m5atRmDqogzXJfIJ4vUy+SFZu+XWNYs4DmgQXOBGR9ejGKJve1iiAhPiEnZyBpouknge/
	 zBMrbPRJJolmLWhOF9T7wXllFVH09qrG8hXVPmWO36H3qnmosgUuQDJkd3pi+s90wgQEe
	 NPUmY0JmcpFtUC2/69bouf82RzNVFO0dnD6e1+W5b/f52HAkdIqk0WkV8IS9/mP2rcxBa
	 ESuYZ/WSqXQLYBW7XV5uRWy1T69VgqFFdhCJXGdHRGsToX45+nj/LlnWR3Y6Xuhbs6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lenovo.com;
	spf=pass smtp.mailfrom=lenovo.com;
	dkim=pass header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b="6A/AKqGW";
	arc=none smtp.remote-ip=148.163.148.104
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9C6606A32C
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 12:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9C6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=6A/AKqGW
Received: from pps.filterd (m0464638.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0LsS211095;
	Mon, 16 Nov 2026 12:04:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=28uFzmtH4lf9iuyVjWJFKH1Qlf/3r3oCgi
	kfBVUhpug=; b=6A/AKqGW/3TGztRlNZgg8EuP+4tJDTB9D3NFq0a4m+l1Ysfobn
	jERy89rIscP/QuALZITLPaMed6wrwF54IQ//dnjd+FGAfBFRdyFJW2xrDxJrEdRx
	twQX09qX7NPOY/EUgM0xP7g2tNr95k0vFpTk0vjrBZ46crLkkFbHzhI6TXnHJE0S
	9Knli4sQX2HWy6kWOERbijwYWNB1J9Mjz78k3xll5NaHQZPoCCkKHPizjl2NsFdf
	PIo1duYvIa/pLwYKQk8jC3AAwM7+93x6oddjmdCIxe9iJLmqQ5pG2BauPh/u4s0j
	Z/Z9KqET4+X1XNo11oTcia6l6Ut+IMham6MA==
Received: from hkglppfpool2.lenovo.com ([103.30.235.219])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4hy33fj1kn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Nov 2026 12:04:13 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool2.lenovo.com (Postfix) with ESMTPS id 4jSmf72Sfvz1yfbXB;
	Mon, 16 Nov 2026 12:00:47 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4jSmk354Shz18W8nZ;
	Mon, 16 Nov 2026 12:04:11 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, jdelvare@suse.com, lijq9@lenovo.com
Subject: [PATCH v3] hwmon: Add NCT6801D EC sensor support for Lenovo workstations
Date: Mon, 16 Nov 2026 20:04:09 +0800
Message-ID: <20261116120411.994284-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NyBTYWx0ZWRfX+KyAAzLQ4+19
 UZxv1hwbkT04TMUV0LmmtSlim9VTXoaBmycP3kxA7gQaeeQBOh99hlTURvyFnYzRuPgUIPXl3jF
 Wm3At83KzIgGiHPJ6drTkkL15G6h2ylfMlpJ8K9/M9TNBrqnftqZM/07B+ng0H1z4qzZDZKaelK
 UP4PoBGFRyRC42RYlbAuXNrUPQG5Kb2UYWw3bDc+IrytbEHn94sSI3Vp/XfLcSqOyL/lR5Fwb6x
 X26iaQU0DWvsCVXCHUtzZFZdWCKmgy4qxIjnK2rDUYdaYwVcv+uoCKiuO3jg5CL/zC8kuvjzcIb
 oC4Wt4ZSQiAWcQ2ujxaC2JgwcEjSKLIeIGGzUX+8KeorqPiAzACr1x8+RFzhEh7N+/AbrqH0ZyM
 koQG07Z7psQTmBjQIA1Pa3johOBrqh6g82pm7Yd7pTvtVAE4rMMrZVO53Fz2AOaTZnNucDlG2Cz
 SnnFOG9/MBeydpayemg==
X-Proofpoint-ORIG-GUID: me3j-F4MtWrwOxj1wntfniJE4z4LNNZl
X-Proofpoint-GUID: me3j-F4MtWrwOxj1wntfniJE4z4LNNZl
X-Authority-Analysis: v=2.4 cv=IIiXmQvG c=1 sm=1 tr=0 ts=6afaf13d cx=c_pps
 a=Z3w50ro9cqVPZ6U0/1IFzw==:117 a=Z3w50ro9cqVPZ6U0/1IFzw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=QJilI6ASod0cdCKXAsqI:22 a=qYyBFI0LXN302s6qaD0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NyBTYWx0ZWRfX7wRIZxwsYFku
 gNsSPvbvs2nuG533Zu4J+/3FAfcdCrWjwZaT0/dnO2lMkD60aI3Ufz2UJCaHLvqVWdQGjMUi48Y
 /yCmu3LO6URsviEDiOBeZgwdPMK6UzM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160047

This adds a hwmon driver for the fan and temperature sensors that the
Nuvoton NCT6801D EC publishes in a shared-memory window, as found on the
Lenovo P3 TWR.

The controller has no hardware monitor logical device. LDN 0Bh is the
ATXPGD/BEEP/DDR4 block, and the registers nct6683 expects at
0x100/0x140/0x160 do not exist in the Datasheet at all.

The window is read directly. The DSDT also defines WQD1..WQD5, which read
the same offsets under the MWMI mutex, gated by FAAS bit 3. That bit is
clear on this firmware, and the driver refuses to bind if it is set at
probe time, so the two access paths do not run concurrently as long as
the BIOS leaves the flag clear.

Testing on a Lenovo P3 TWR: the driver locates the window (0xfe500200)
without any module parameter. Under full load the CPU fan goes from 808
to 2920 RPM and the CPU temperature from 32 to 100 C. At the same moment
ACPI TCPU reads 100.05 C, TCPU_PCI 100.00 C, x86_pkg_temp 100.00 C and
coretemp 101.0 C, i.e. four independent sources agree within 1 C.
checkpatch reports 0 errors and 0 warnings. On a machine whose DMI does
not match, the module refuses to load instead of staying resident with an
unbound device.

The layout inside the window is defined by platform firmware rather than
by the controller, so the offsets in this driver are the ones the P3 TWR
firmware generates and each layout is selected by DMI. The driver is
named after the Lenovo EC shared-memory window mechanism rather than
after the controller or a single model: the same mechanism may appear on
other Lenovo systems with a different layout, and supporting one then
means one more DMI entry and one more layout table. A machine whose
firmware lays the window out differently fails the plausibility check and
reports no sensors rather than wrong ones.


Jiqi Li (2):
  hwmon: Add driver for the NCT6801D EC sensor window
  hwmon: Document the lenovo-shm-sensors driver

 Documentation/hwmon/index.rst              |   1 +
 Documentation/hwmon/lenovo-shm-sensors.rst |  58 +++
 drivers/hwmon/Kconfig                      |  18 +
 drivers/hwmon/Makefile                     |   1 +
 drivers/hwmon/lenovo-shm-sensors.c         | 553 +++++++++++++++++++++
 5 files changed, 631 insertions(+)
 create mode 100644 Documentation/hwmon/lenovo-shm-sensors.rst
 create mode 100644 drivers/hwmon/lenovo-shm-sensors.c

-- 
2.43.0

