Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308003A16A3
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983063; cv=none; b=lFRHvqYSD8ADel0+zp78piA+bW25+YM9BtAsp8QmPnyQfB6E+HKgKaEgZdWvlNblQz0Zb1ldt6n+6eLgkRV2EoJRQVaB/VfpxpXr1f29t6pa9w6t4ZC5acaAhw4PrycInOXv931IRw+zyufaqn5QRTOEORig3qAPyi0x4yVg5so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983063; c=relaxed/simple;
	bh=v/4WdSNP9aZCN0L17W4ztz4Km/AWVdBtBewlkUfF3lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=TUU/bqgbzDghSXjAhOodCtX8lnY5LhgtaNL4JeXHD1aVPg6wGb3AmDWT3dKPKq8+omQFgqC4KZEbgjN73LuDKOtGb3+otc2Y7SE9+1HZF3X8HkU57MdpgUVfNwXYTvEuYkJP0YCthR3M3C4hh+55Eid3AOz/64mictIpnAYJUsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=J5TpfGdd; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="J5TpfGdd"
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 47726401F4;
	Tue, 31 Mar 2026 11:51:00 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id 2BD0840261;
	Tue, 31 Mar 2026 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; s=dkim; bh=M/WqrY7z5z3s
	7e4DFKcURtOcYME=; b=J5TpfGddteOKwDgJXgWURVdEWlq57qaW99hLz9uVBUAz
	pAYehedIDAGNKyTX/gEj9Gt9hROXY6Xa/SY2caOCnXk6SBFvm0sPWSdmbr54yuAf
	qTes2bGw3GRjYiGANKaHBh05NznTt5G5kFqriNfZPGRkNM93amg/E2nKng6IsF8=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:subject:to:references:from:in-reply-to
	:content-type:content-transfer-encoding; q=dns; s=dkim; b=nihJdy
	A1vffX8ddPoi9pk63UZRAYmKoYq47CgSQ8RYDuRdno9GaGTwvhRYh1QsZaidNG6R
	JVIoBeet7dbJRHx6N9j+2aX2pGTexPVABaH1414nP0lpQbzU3K0bOEOkR/dOZwV1
	7zvrKXclygbdkqjWIGGr8uqtwFyRpK4p5IOr4=
Received: from [198.18.0.3] (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id DEC43401F4;
	Tue, 31 Mar 2026 11:50:59 -0700 (PDT)
Message-ID: <5c69b240-a96a-4e13-8a38-6e7738f6993b@fatooh.org>
Date: Tue, 31 Mar 2026 11:50:59 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Guenter Roeck <linux@roeck-us.net>,
 Eugene Shalygin <eugene.shalygin@gmail.com>, linux-hwmon@vger.kernel.org
References: <20260331175245.354188-1-bugfood-ml@fatooh.org>
 <b31eb77c-0106-4163-928f-81e521c286a9@roeck-us.net>
Content-Language: en-US
From: Corey Hickey <bugfood-ml@fatooh.org>
In-Reply-To: <b31eb77c-0106-4163-928f-81e521c286a9@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-03-31 11:08, Guenter Roeck wrote:
> Guess I don't pay close enough attention. Sorry for that.
> 
> The above text is appropriate for comments after "---", but it is not
> appropriate for a patch description. Please see "The canonical patch format"
> in Documentation/process/submitting-patches.rst for information
> on how to write a patch description.

No worries, I don't mind iterating. I'm a bit unclear about what you 
need me to change, though.

Is there an issue with the formatting? I sent the message using this 
command:

git send-email --annotate --suppress-cc=all --to [omitted for brevity] \
     --from 'Corey Hickey <bugfood-ml@fatooh.org>' --no-chain-reply-to \
     --envelope-sender bugfood-ml@fatooh.org \
     --subject-prefix="PATCH v3" @^..@

In my editor, I added the v2 and v3 history after the ---.


Alternatively, are you saying that the commit message is too verbose? 
The documentation seems to encourage that, even for short changes.
https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

If you want me to write a terse commit message, or cut off the current 
message starting at e.g. "If there are any other boards using 0x37", 
please let me know specifically.

Thanks,
Corey
