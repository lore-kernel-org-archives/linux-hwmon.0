Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAE21B0406;
	Wed,  8 Jan 2025 08:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736324772; cv=none; b=scKQTBAWsnM5vEILHtjDZ7ABlEKIQ0mlsv3dodNY59MlW8Y9CRGJKPlylOh/hGPtCVv9rj8Q62JVunac+o2/llUcpzGGy0+pEJy6f6dNkjVlgPA9rJW2XlvOF/w41vMzR2eBk2NGajYyejNPi8vTlmwbdbfVyxX3GGJqEEdmRsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736324772; c=relaxed/simple;
	bh=tiZPEPGuNmZU0W2u0gzV6gTwKOSmT+yCKWAAjRssC/E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Qsb4R9S8jNWMEjbMenb/RifsqahcFwn2UZJcThXhtUg7uadPOUocECrHhQuQfYlHGlrXwqe72Aw//nmeTtVbSLqvveNVFMGY9q2W+9g6PBvypC9F7Wv6wNCF/wkTVlLdx2BjefIoG3je0Wz4hdJWypSSuWSsuHBKGRki/1uyVB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=UDT+JlOF; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="UDT+JlOF"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5087tt5O005800;
	Wed, 8 Jan 2025 03:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=FkxR0v9nas5hYvpZ7exutnfUXYu
	1GGHoTi8qc5VJ0X4=; b=UDT+JlOFw7lHqEeLEph+Qjcma5HQKswCc9b07cP775n
	wQbPouyb21Zynkc8z+T9K3FvZrsy1YUyy8gRkyyqVr/Y5hnQC4KlgZbXukv0qGY7
	PywfGbf7ZwH2g5mRJ2qNi0GT6vYojzV2SQ2pHzK5AU3BUZZLkVyOuJg2SvJlHWXu
	xI8z/FCPer3h5gQo6WHERToqrMchpQxAO5iTsSHoQCyB8ird1sPC1bTT16ZSvXoA
	PjMtL4zGJ4pbZz1QQSeJ+KqD4TAhzpZAL6x0R7gPkXuCrzsHcXT4nhqBQiADQc03
	B+nqyKHsmjR44L/UyLGgQPkr3gRws61Ti7X6VC6EepA==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 441ndj03u7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 03:25:54 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 5088PrVJ037157
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 03:25:53 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 8 Jan 2025
 03:25:53 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 8 Jan 2025 03:25:53 -0500
Received: from JGERONI2-L01.ad.analog.com (JGERONI2-L01.ad.analog.com [10.117.223.6])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 5088PfdN026945;
	Wed, 8 Jan 2025 03:25:43 -0500
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/3] Add max31875 support
Date: Wed, 8 Jan 2025 16:25:28 +0800
Message-ID: <20250108082531.15467-1-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: X-ps5ICipM6NQkfyYiCqpC-DeipUrxOO
X-Proofpoint-ORIG-GUID: X-ps5ICipM6NQkfyYiCqpC-DeipUrxOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=921 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080067

The MAX31875 is also a Low-Power Temperature Sensor similar to the
MAX31827, with some differences of register addresses and bit fields.

This patch series adds support for the max31875 to the max31827 driver.

John Erasmus Mari Geronimo (3):
  hwmon: (max31827) refactor enum chips to chip info
  dt-bindings: hwmon: adi,max31827: add MAX31875
  hwmon: (max31827) add max31875 support

 .../bindings/hwmon/adi,max31827.yaml          |  18 +-
 Documentation/hwmon/max31827.rst              |  40 +-
 drivers/hwmon/max31827.c                      | 586 ++++++++++++++++--
 3 files changed, 572 insertions(+), 72 deletions(-)


base-commit: adc52dd4078067fabf1431036ba180eafd8a7eee
-- 
2.34.1

