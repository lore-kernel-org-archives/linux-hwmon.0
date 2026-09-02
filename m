Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B5635C1AD;
	Wed,  2 Sep 2026 16:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368205; cv=none; b=rQUl4/UBXccU0X0zcqAMEG6cpyBMm6PqpAIaWts9GI6tHvTYM5AOhD/bfuozYHRzfHmVPuFDB80qPLfsvP6/RsbvfWO1khWppOwckVYi/Mq11rEtzxeMvD6s9TCH9bvpwbpRUfc7IJfgPXu7taO9PCmUQppFhO7gm7D/alshBpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368205; c=relaxed/simple;
	bh=foIHL019PEVDd3UNBApZLG9EQy7TV2blOiT/p9h6Ork=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EqfYXvoIvropNDPrKMDK6uNP9XcKWb5szJ1i6jB5lCsP+zMvhkpy+/RUgyq8jlKagydCzHyxGQZchkCbjZGfYTD4ORMfuv0EarksbSI/Xt65AIA1DUj9XQ9+FRVWzqlefm2h+Ykz3Puq87Di+dm3KAdYPhPPpFwWPrHGNVzbA8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=YL0NJbU1; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="YL0NJbU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788368198; x=1788972998; i=w_armin@gmx.de;
	bh=foIHL019PEVDd3UNBApZLG9EQy7TV2blOiT/p9h6Ork=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YL0NJbU1RSy83e1p5bqjlLOsIOxegneP4wLAb0v5rc7a+umBSXTZQ2ujfD+A6q0N
	 yrmhKU+chUuv7rXwQBDhwTLivLQuwTFht5EFwjAHEZBXTbC3qyl1bNlBqex3gFfnL
	 syX9YI9METBjDDJx3rvirfQaW5tk9/Nl9jVnBSnI1yFTIGkpRZMzp9IozsWk1T21h
	 B3gcoslLl1cCXo1TjhrVQKm51ByLjE3t7Gwb8fXTz0ioaHXSfDw4ZlKHQlMcyjOZX
	 znrwRzdW6KvX6Pg5uHZ8adCyDodxgLu0pcUkCvXcnVcsCEtI33FPeVf3vu1oLLhkT
	 hBj62GRBs1W9fi91Bw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysRu-1wgPnY3EZu-00uTnk; Wed, 02
 Sep 2026 18:56:38 +0200
Message-ID: <42d55fce-65ee-49d7-9892-451a72710a63@gmx.de>
Date: Wed, 2 Sep 2026 18:56:37 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hwmon: (spd5118) Avoid probing when 16-bit
 addressing is enabled
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 ggirouard@bungeetaco.com
References: <20260901200142.495319-1-W_Armin@gmx.de>
 <20260901200142.495319-2-W_Armin@gmx.de>
 <b2174e73-79ad-4462-93d0-2e69582636b1@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <b2174e73-79ad-4462-93d0-2e69582636b1@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:+Zd19NxnvJRAvUOitOtAoU200ksw8WkLO6C7mlhTpOe9SZMRAT5
 C98jis0Y7Bv6R6svxh8dbLd55HIJ1anUJ6lJhUVtJbq8pjTEXXtPFn8bUmZOasNEAsCdD/D
 StztqElxpJHskXlnsxegLM7BLkEoodxqbyOgJRzSD6tMrqu9CoiibL+s4BjokEC0O8+3Vt1
 M9HvZjJgqSRVAVrL7VOoQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6aksXfAQ6Vs=;FkSgurqxDXHYSaMPMOLXXHyfOaV
 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

Am 02.09.26 um 01:04 schrieb Guenter Roeck:

> On Tue, Sep 01, 2026 at 10:01:42PM +0200, Armin Wolf wrote:
>> Support for 16-bit addressing was removed when support for i3c
>> was added to the driver. Switching between 8-bit and 16-bit addressing
>> might confuse the system firmware, so we are forced to bail out if
>> 16-bit addressing was configured during boot.
>>
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Applied.
>
> Thanks,
> Guenter

Thank you :)

Hopefully the suspend issues on DDR5-based Intel systems are finally solved.

Thanks,
Armin Wolf

