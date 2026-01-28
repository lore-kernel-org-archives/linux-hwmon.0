Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252032EDD70;
	Wed, 28 Jan 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769596102; cv=none; b=FMYUHkWcGJ0/IsHPmvzTCDiHkjNxwfMLvRooru2JQYtmpNA7x1+qptW2iA6pO7R40UoY32b9kgZpPTIwIhLwQwMT5h8gHXXrpnXC4iY4minuvsYS+p+wzEiUIc521qxDgtSH8s1NBRAV+QT4qsEyv91O4ImJQzCqKghYdqWkKFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769596102; c=relaxed/simple;
	bh=L8jFm9Y0nsEVid6mR7NBmM0Yyo6uoUC1/L80TzAmgqM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=TPo7jmKHA5ecg+PisB73yfqYvR25Xqzoi9IohgWfY06dQGeZeXVqTC1hNHMzA7EEOn78mR9CRBNTFMMCQkHquWZvLHntKtRLlgZQ2DPbZ+KvgyfAEYxeV0dABl34vjnGFr0OfQoTLOiDlPbbCu2UaUk/wX+yC5z76Oalljv97P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=w8bz3Irh; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="w8bz3Irh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769596099; x=1770200899; i=markus.elfring@web.de;
	bh=L8jFm9Y0nsEVid6mR7NBmM0Yyo6uoUC1/L80TzAmgqM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=w8bz3IrhEXiHQDCF9ElSxLakastZ1yiSLxoKUi4vKaWSgT0NWSAOfEWYsBbZeXz9
	 FYTZn15UHGr+OoZ4SBNLQLqOrF+VtWlApTOnEZ3PzprM/MqJIU/ynr0GTZP/g0xcE
	 ZPUwQ2otKI7VvPoDLjLEoBQBnCsDHX6hTp4q7dknn1Ss1blL0PmOKayId1YJa1Xy+
	 86U2RNaWKF1DI/X9eFhbAYDr3AfW87PhuDu7PX3QgR83gpZeyxkfi7RVgagjXL62Z
	 Pkq1HonLNopvEMFUg7w/fqlWcbM4rXcMjo31gamHiA64DWmFG9PFvnFfmE0muJio0
	 tiD+zAFOUpJhlLwjVQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.179]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mm9VU-1wBGnT0JM0-00iCYx; Wed, 28
 Jan 2026 11:28:19 +0100
Message-ID: <12c2090a-55bb-443b-9b28-13f39a64cbe2@web.de>
Date: Wed, 28 Jan 2026 11:28:16 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, linux-hwmon@vger.kernel.org,
 Eric Tremblay <etremblay@distech-controls.com>,
 =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260128073021.2476709-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] hwmon: (tmp513) Add missing check for
 device_property_read_u32_array
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260128073021.2476709-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3JE6yCgTTW7ZSG9YVTPn9nYJSf67+QfL1B1b5v9obIx9DERUfmb
 Jy/8Uq3E/++76iUOWk9yVG/3qoAzAlZ5eR5yaZX7WJynHD41ds4LG9MeIp48dR/Oh2qywF4
 PUzXG71OG0pZSGMsORkE763DFBACevelh9KfjE+osjnyS3rwrZdjwokRk8lVOrSL/p6qDFR
 H+EnlmnjS2d/FwtkYI2iQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8cYNT6d+dHs=;H/ov2iDSa1ArFCZ8TNxTdBkaX5C
 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

> Add check for the return value of device_property_read_u32_array() and
> return the error if it fails in order to catch the error.

* Were any source code analysis tools involved here?

* Did anything hinder to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus
