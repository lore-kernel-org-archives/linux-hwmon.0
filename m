Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043238;
	b=QAMIn8U7BkkPkP9+vVjI2Ufi4MhXRRSfXIm212OcJFjR15LqSNlIsjreORfhyusap3dE
	 XWu4fsSCMorbR0+/ER4rlQ7Q1bkrq41+eUtptICfPLLRLWYaII2C6GkViASNJH5yeY1Ch
	 SO2NP4kTQOTj7eGB0uKOpmgD0DntgwYPuWb0BRrRAcfN2sl1+5rYa5DhlHJ2BhlpGdVoR
	 ENvtjm1TZ+J6g8JTc4QGiLf5KYRR18U7lSGhhqt3Qx53JPsppBOTYrStr5Ucay8f0BUFB
	 gtIwx5lgoAM/SWn+hQwulLQQ2bnqNAUTH2vPK2AOgggcCnXmF1H1hJ+myi3yGg3O6bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=omRFy0cHyVLNWnAUCIu2kHA+eYvWta9ISAt1zEqsNXU=;
	b=3Bp/6E8Ge15TyexlY0JI7U3cD+fNyBCY/RkABbms7BZk0UkEfY+TnZBnNNchRipQKOnB
	 URIcXVaCTe5R5QyCd6+rY/9bPc2ao5bzrI/nchpop5FUYvuvmzneT9Ns7GTSJKqB52zut
	 qvExOsL2Uc1WPfWGFCABjp5r5lDiO6zzSMPyvDsEQpAiiDNBLr8T7sofRSwQKQYBPBoTq
	 kk6fIQ7haVATaS+y62RB/IFCJF4MMdCMHPw5S72oH+hixSvVXJiidZ4BV21ji3nPfo721
	 KpssoAyUZyDXsYrb/AZ3nA4heuORec4m64S+YEqtBWcQ7wJor6BPdOxjkEY6ysosyRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P+zg+FTZ;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E15F606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 19:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E15F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P+zg+FTZ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-369f33df08eso3682184eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 12:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793043237; x=1793648037; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=omRFy0cHyVLNWnAUCIu2kHA+eYvWta9ISAt1zEqsNXU=;
        b=P+zg+FTZaPnoLv3sNo3Rbrq7MdxQMEVlG4sFYf65DZsur9eCwQNFm5khndSy6mesI5
         vskp7JWhmWSdXu3gbApqryLbJFOioha7qtwWilDIkY7409gVpaFofUaAtcpXpnoOzOt2
         N5GOI+HL/QJCkiw6Quy34+PL7Hsoo+RKYsGV1JnXNr5W0DWXuMtVlJmTkGkO9BpychpK
         Zjzt9++Gtj1IlwNRP/demXiZN2n58CGFdCNg/xdeRqcSyz8L3MUfc7Bus54MuuxVfru5
         PxXIpegtD0koifEN0dhnGv/3kdisRxax7+ytQd7hfb28hOR7nfCLH9BVEei4X3yhWA3+
         ZG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793043237; x=1793648037;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=omRFy0cHyVLNWnAUCIu2kHA+eYvWta9ISAt1zEqsNXU=;
        b=jpbCjv963D3/xgIbkHfK1Wx/QWgruqduoscUOoIzXVQWfJvGyIZfWJ0RBdGNY32xsO
         GxyAuGGLYBTRaaJ9dmdNYS3dCP5WxtI1uYvOKmehirhLz+bzaNXEL/LwGqVQKuwGFHvN
         gZX8wHsJtbCFU9G2GI/4manJnfOnY18L0pupGVB//vfDsLboTvUUOlMpmECPCgeejqxQ
         /n20x4j4Zx0q1+OoznJ71LI0sVX3MzNPxMQd3gYki7HgjeyDq9OAoerW+TXjLZNwVqXk
         MDPgYHPq6yu0m/NgZtL5qJjVh31xwT9QuMsBEwO+4VlR/RVBjrg+TlE1JJ01/gpEnxhk
         mD3g==
X-Forwarded-Encrypted: i=1; AKwUvBwq+7pSDBDPJ5ntBK893ccfN3qm+WHv5U8QtbPnojCfRENIP1dCv0mujJDrvxyN/fOmIAf+JLYWRAvbJg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIu3cPfISrMndYmiweoLeU3UfNfiH//8Xh6qQfq917GmQ2UH/9q
	JaOe9SoTWrEYkVwcsEiqMfqfVbYQfdIczKns42XYlWaN6CtMQSsdfk6K
X-Gm-Gg: AYBFou2HZKMF7RHKatViGdIgePY9fG1wQqSNLgU3Y5ydT64UxGU3iqaizHD5zocA5er
	qdsaVnoeSZUlDpYNwzT15szfDys1dN70bWPQGnyAid6bQrb3U7QpXAgWSnq5EgOFJXEYqTACttq
	f/+znx166U5vORYIa7Tg4eS8OGzVAHvg7CbVObJxDTwbfSVhRLA8dmJqRi0ghNVVm7UbsgD3eL/
	GganXLx9k6KxCFMJtqIm8nUP2YBIPcBCgBT4NZ/FwNYMcWJgGW7HZCYjCRAz+Qgk/2nSuTtVdym
	KGI6t3uiYlFU2wu579fu7mxbr2JLkSyC0cInRwJyF/gcHyt9aXCcIiamYrEm7CJCARyQxHLJbqX
	j7h4TZSZm3iNIjQUHxly5CLBQkAKDks8gM5wSzS+tP6HVStCszzIvCeO6jeVG2H6g6TRJ5zpE1Z
	kOAqw5E6D/z3lTja3K2wxWQRN87KZR3C+Ipqk6ycF021mgr99u05W2IKFAIVoQfuDMJUDmfn60S
	ADg/K4Koy8AkX2JA8trDeaIrNKTA+AETBaFu8/P40tQZO3l4FbFo4IckyRY0duafLpyp6plzm0y
	GFFUdlXHpBlD0jgymQy526lf4IHXpW9n80lMBV6ZNS0=
X-Received: by 2002:a05:693c:60c9:b0:369:f72d:1010 with SMTP id 5a478bee46e88-369f72d12e9mr8594937eec.18.1793043237086;
        Mon, 26 Oct 2026 12:33:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm31461352eec.13.2026.10.26.12.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:33:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 12:33:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Remy Demangeot <remy@demangeot.net>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (asus-ec-sensors) add fan extension card fans
 for MAXIMUS IX EXTREME
Message-ID: <98ee6ef3-5e5d-46eb-9a51-e732ebee540b@roeck-us.net>
References: <20261026-b4-m9e-ext-sensors-v1-0-644d389b2de1@demangeot.net>
 <20261026-b4-m9e-ext-sensors-v1-2-644d389b2de1@demangeot.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026-b4-m9e-ext-sensors-v1-2-644d389b2de1@demangeot.net>

On Mon, Oct 26, 2026 at 09:57:36AM +0100, Remy Demangeot wrote:
> From: Remy Demangeot <remy@demangeot.net>
> 
> On the MAXIMUS IX EXTREME, the speeds of the three fans on the
> optional ASUS fan extension card (EXT_FAN1-3) are not at fixed EC
> addresses. Bank 0 register 0x43 selects which fan a group of registers
> describes: after writing 0x0a, 0x0b or 0x0c to it, registers 0x57:0x58
> hold the RPM of EXT_FAN1, EXT_FAN2 or EXT_FAN3 (big-endian).
> 
> Allow a sensor definition to carry a selector value, using the unused
> byte of sensor_address. When reading such a register, the driver
> writes the selector first and restores the previous selector value
> once the bank has been read. Sensors without a selector are read as
> before.
> 
> Readings match HWiNFO 8.54 on the same machine, and follow the fan
> speed when the fan duty is changed.
> 
> Signed-off-by: Remy Demangeot <remy@demangeot.net>

Applied.

Thanks,
Guenter
