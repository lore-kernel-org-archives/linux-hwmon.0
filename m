Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354723;
	b=CQXN9y3VnY3N+p+q01ArpxmdIhOFIHmZY/DdKxW5biHlu5auwzMUMPsffzlBbQ4pbwvI
	 k8Fak5N2x5jizWArHQ+VO3zkTbfLvi8KPPIxUoKCayF6s2J8/AUSkimgTh6Y4pdG2cFso
	 wtjY1sqV+Vb4N30pZjb5lgZp0zdI12N8QOj0bsSEzx+REgScL4ydLYS2rkdoVF77Z3NbM
	 2EWyf3IOdKOz3RF4SU3nqf1Q1GhLPYGJCApgOCt+TJ08ZKMh+0HHwpk82XucIganp0ytP
	 5jo/O6a6z/4e5hhMcWOqnG7HgWe1EZoPrlQUQ5YmH8O9CGsEcnBK/fgVzcBI0zZpaAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354723;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ADIRuleOP-NewSCL:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lVZapjEGmvhm2mXCrfUlGaI0wRXm4CUffX5rBqaLlSM=;
	b=No9cQP4ykqVAIK1+lTOKtV/4uxAl8USvGe9X1P/h73Li6XEnkeXzn03fVtSRW0tlBeBy
	 CcNu71SFTGv39LNIJHB+p0koSN3mWyN/DwKXwAey6Y2JOs8eqAWhQKizIl5/dnwmW1OF5
	 FnU9G1CxJgvo2ReSh7d5STeYVi5xOUD7V3GdHHgDlLwdhfPB1MdsLQr0RNedPi62ciY2q
	 /8AHDDb+7wED7RclQRWE8eIQMmeaZPvRCJoiaIjeXI6p/q855Z9GBleJzHaJgbj/Wcvy/
	 CX4MSJ1xOc2+5jkwJ4R6at0YTXS4J+D2ZbEg55g1gOUHTJkOHPy3FlSAjaRbrDYgzFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b="Y/IbQi4w";
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b="rVCUU7g/";
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443D960A2610;
	Fri, 30 Oct 2026 10:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 443D960A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=Y/IbQi4w;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=rVCUU7g/
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8H95P3235923;
	Fri, 30 Oct 2026 06:04:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=lVZapjEGmvhm2mXCrfUlGaI0wRXm4CUffX5rBqaLlSM=; b=Y/IbQi4
	wWntewQWn7fAf/5gUq8TXFzfqBPd/SEzmFlDOQ440YPmeZtRyAXC5jCRyF1tVpnN
	sgPwObsAGzTiMfoAjN+cBvTUrP8JGuD04zc/TkMUBw4iFZkqCV3V8Eu3yWbDO8gH
	CVfCTlOtyuaaKFB5jgX0rVR1bof4y1Olx8s2FtY9TBPcamL7cQWqsK0oWcdtCkT8
	Xlkg1xcyG9Yr+KYonWGDHoQYqpN7cPHhaqauBkaUECq8d8AsnKmSqv+nNRxtf/TK
	xmw56+qouW7NUS751rHkccRuKJQKOaFsx4fholdf65zHQnw1wHf7/3u7NG4N2aVq
	cqEwuj2s6DvarFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=lVZap
	jEGmvhm2mXCrfUlGaI0wRXm4CUffX5rBqaLlSM=; b=rVCUU7g/3ZWkVpe9owYCn
	MYqG/jesF8cF67qfpn2ltmwX/AkpRartyX+sdx0EW7mvcS1XLLNgvfkl0rzUygr1
	kzaT876wzV/hfpvsKd4kBZTkZrrllFyw3xlSQ6+vBG5IoYaRy0SowhdGWjQEFw1+
	I5hUyhPLbUdGhpGNpn6gTf1dUk5qrCYoQjYs6VlQtgUcpEGFOFITd89eXvsrcs0z
	YqKC3L82GMjwGS4Tvmj0ND4Y4mWp39DvEnnOPy+21WKsNGZXLLIi0QEH0JK1us4B
	5NHvZFgGuJLCCuSHxdo9arcxX1Q5sd7jVJfQ6XVb02k9AjUm6Om1wcPva28LWqzV
	A==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hme7bkcdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Oct 2026 06:04:43 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 69UA4gU9021658
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 30 Oct 2026 06:04:42 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Fri, 30 Oct
 2026 06:04:16 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 30 Oct 2026 06:04:16 -0400
Received: from CJONES7-T01.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 69UA3v9T029336;
	Fri, 30 Oct 2026 06:04:00 -0400
From: Carlos Jones <carlosjr.jones@analog.com>
To: <linux@roeck-us.net>
CC: <alexisczezar.torreno@analog.com>, <carlosjr.jones@analog.com>,
        <conor+dt@kernel.org>, <corbet@lwn.net>, <devicetree@vger.kernel.org>,
        <krzk+dt@kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <rdunlap@infradead.org>, <robh@kernel.org>,
        <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/2] hwmon: (pmbus/max20830) Add support for MAX20810, MAX20815, LTM4739, LTM4740
Date: Fri, 30 Oct 2026 18:03:48 +0800
Message-ID: <20261030100348.1955-1-carlosjr.jones@analog.com>
X-Mailer: git-send-email 2.51.0.windows.2
In-Reply-To: <d8c327b8-3113-4490-83b2-70cf3ccd3224@roeck-us.net>
References: <d8c327b8-3113-4490-83b2-70cf3ccd3224@roeck-us.net>
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
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOSBTYWx0ZWRfX2Rrd7dCzGW/v
 pr5PAlcgHtrywvH+YBvjdMSfibJ22F/ptW+QCKT12G4S1q7g458ocSUKSgmdMQsnmYucANwrbBN
 hCI76bl5pJWejy+zndKHYooMyJQoX4ZKDzK1k0LUmUu8WtWuZhGDjN/YKtfZVizvLFm0jwTvrck
 pk0MUMFBXYnXI+vjw4djfQNJoyz1pl5YKmvcTFLZvotOOAEiSOI3VAyRSPgXP3k/m60NCCwi4bj
 dJjmU1emJi/72J1q7RcvdnC0sbppdAU9adexlzFvc0F1sHM8XFC/paT8hRMt2Su7pK36b9YoMkG
 73KNeiC2hGc2y88Fg/mBEXp0ashelEW6QEHCrDByEVIpsR5d+5Ph8TI1I/oigGDN3CbupqtiXhp
 Pc6RD9ajnAx4mt8Dt5Pta95lkYKJCMGP7ZTRfJKtFHaQNPiV/SIUwnUL6S3JIdRIf9EbW25l4vi
 XAxONagpgF+0CnBd/pQ==
X-Proofpoint-GUID: 2CkKaVsN44YC7MMHx_DqK69fIzzkKeBA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOSBTYWx0ZWRfX0yCHhfSsbLqc
 UHoW98OGWsf0DgQmNcZEVeLGleCszxVBei+hpwRK1BLNCj7EZYlcppy4BaqWAE7+gfkRD+3WY2a
 qYKmrJ5Cm36mKExxPco/GHG6lFH7X8ydW+r/d3p45wTHxVoSNJJ5
X-Authority-Analysis: v=2.4 cv=XfMcX455 c=1 sm=1 tr=0 ts=6ae46bbb cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8 a=MVqydGpOTaDsIWKYR_wA:9
X-Proofpoint-ORIG-GUID: 2CkKaVsN44YC7MMHx_DqK69fIzzkKeBA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300039

From: Carlos Jones Jr <carlosjr.jones@analog.com>

Hi Guenter,

Thanks for the review.

> According to the datasheets, MAX20810 reports "MAX20810", and MAX20815
> reports "MAX20815". I find no reference to the "B" variants on the
> Analog Web page.
>
> LTM4739, according to its datasheet, reports "LTM4739", and LTM4740
> reports "LTM4740".
>
> Please explain the discrepancy.

The discrepancy is between the datasheets and what the parts actually store
in IC_DEVICE_ID (0xAD).

The LTM4739 and LTM4740 are uModule products built around the MAX20810 and
MAX20815 dies, respectively. On the hardware I tested, reading IC_DEVICE_ID
returns the internal MAX die identifier, not the LTM part name:

    LTM4739 -> "MAX20810B"
    LTM4740 -> "MAX20815B"

So the modules report the die's ID (with a "B" die/stepping suffix), which is
not the string the LTM datasheets currently document. This is a datasheet vs
silicon mismatch, not a driver choice: the driver matches what the silicon
actually returns so that probe succeeds on real hardware.

I only added the IDs I could confirm on hardware (MAX20810B / MAX20815B, as
reported by the LTM4739 / LTM4740 modules). I deliberately did not add the
"MAX20810" / "MAX20815" / "LTM4739" / "LTM4740" strings, since no part I have
reports them. The driver keeps the LTM4739/LTM4740 naming and device-tree
compatibles for the modules while matching on the MAX die IDs they report.

I raised this with the product line and a datasheet correction has been
initiated to document the MAX20810B / MAX20815B IC_DEVICE_ID values.

If you'd prefer the discrepancy spelled out in-tree, I'm happy to add a note to
the commit message and a code comment in a v2.

Thanks,
Carlos
