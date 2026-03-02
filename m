Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149C14014AE
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 14:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772463329; cv=none; b=JdLEaWNY1PFfNU4Acw9WY2LXknGxEZ/Kq70H5pq6dyNdLWelh65IPEaI5QEzOlaXOG93pXms5TFmZRMNKVCWta5wcNtCthPtYEX6MI8gHBm9tOgVmb7SiXH7zaeKp1bEuVe1FCwFNbsH0U8HqVLv0RcCztK6yMFkWSYD9nf871M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772463329; c=relaxed/simple;
	bh=Z3U8Qtdow5hcMvzV8D6QhOjTW4vKZxIT4nwKWn+Fywo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sMtEajN5sfI0emnGbfcU1HA2SsVQ02v907B6Sfk9KxGQjUlB5IxfAxXsGlNIt6cjJ5gPlbnvlDY4HW5/b6dMZWcjFuydEjLEEtZ2G74XEoV8hiH8sFoTImwNZR1HssTCvHz9TnamMN7WdERfYN36ZDfu5Em2baTTcUkRgiAzFSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jre@pengutronix.de>)
	id 1vx4fr-0007db-8K; Mon, 02 Mar 2026 15:55:07 +0100
Message-ID: <5353f9f9-adbf-4532-9fd9-e71e70017548@pengutronix.de>
Date: Mon, 2 Mar 2026 15:55:05 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 3/3] hwmon: (ina2xx) Add support for INA234
To: Ian Ray <ian.ray@gehealthcare.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>,
 =?UTF-8?Q?Toma=C5=BE_Zaman?= <tomaz@mono.si>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org
References: <20260220112024.97446-1-ian.ray@gehealthcare.com>
 <20260220112024.97446-4-ian.ray@gehealthcare.com>
From: Jonas Rebmann <jre@pengutronix.de>
Content-Language: en-US
In-Reply-To: <20260220112024.97446-4-ian.ray@gehealthcare.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: jre@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org

On 2026-02-20 12:20, Ian Ray wrote:
> INA234 is register compatible to INA226 (excepting manufacturer and die
> or device id registers) but has different scaling.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> Reviewed-by: Bence Csókás <bence98@sch.bme.hu> # v2
> ---

Hi Ian,

You were faster to mainline your take on the ina234 support :)

Tested-by: Jonas Rebmann <jre@pengutronix.de>

-- 
Pengutronix e.K.                           | Jonas Rebmann               |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
