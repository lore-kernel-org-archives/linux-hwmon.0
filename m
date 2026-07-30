Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D30367B8F;
	Thu, 30 Jul 2026 05:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785387654; cv=none; b=HfsFISge67yG2fYfPWpQIHXBzUTMhet5l77DRUZyz5ixmYvhjk31o8wnbZgR7ui7pMwwjdBqbNt8j10ox3l62KhqAS1W9lsyT48PfPxkZlulZ1exUGxwEF0haLlcRraKl/hLTyCFMW3lC/VNYV1g4SLYtFObd1mDWNK3fS/tp6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785387654; c=relaxed/simple;
	bh=RzJJSKNQFHXXdA8zUrSjwaM3q6X9v+GIkTownBH5xag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZyC49jHIbrTNClhEtLA3+J5axK/9fgu7b7tEnae0G05dqLTN4ETJJEBxELpT2a0qsjosGV53KAr5u2EXqHU6nC4nMvr5vDEkHv9Zk/Yon2AHgy5zuPmtwwQs95iGjm+mdXm+7X2sMBcD8UXcztIzqfxNbgFD4a8CEmRxdhmrrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=pHaOf9wx; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="pHaOf9wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785387627; x=1785992427; i=markus.elfring@web.de;
	bh=RzJJSKNQFHXXdA8zUrSjwaM3q6X9v+GIkTownBH5xag=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pHaOf9wx7WWG0qi2UKj8LDCH1M9bla3LyuWBGaIvHZLcyxtJrDt/pMmOTahjYuuD
	 hga0j1ndoYRFa0qXtVO3XJrZzff8mvegfR6jq9TIt+eRtwWH13Jdq6jS4tM36uyZl
	 +/0JR5dRM6wq4/slOlyAQzZmogI9PC1iVBoDk5U9nw15CuoxYhiVsYdG48EAcBpl+
	 2FEPd8A1QX0MVesIZaq5rX0UBBdPyAcqn6uZszTK6uu7ba+t3bixN+890E6qbL4Jh
	 S+IS4ddU8WS8hSrkAmFdc6waydFrgA86ofuggDyADJ8nNPYEJGlHpMHziQMVLKhT/
	 tOGdMyIPRwcUMZ1f8A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MPaIK-1wbSxc3nhy-00RE5v; Thu, 30
 Jul 2026 07:00:27 +0200
Message-ID: <b3b8a7a3-889c-4466-b27b-a30b3e445ad3@web.de>
Date: Thu, 30 Jul 2026 07:00:13 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/4] hwmon: pmbus: mpq8646: gate the writes
To: Vincent Jardin <vjardin@free.fr>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, Charles Hsu <ythsu0511@gmail.com>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?=
 <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-4-98848151cdb4@free.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260729-mpq8646_v0-v6-4-98848151cdb4@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:/DZX0umg5je7SYGYUKNJ0nRAYEVkuKer9FQB0/BaPvV9toiwPUG
 fuzS4/d9g6Mp+/EP1S5ZLbrA5mY9NjISKGLKXOIQW8B254XyzbL+13SF1FxPVwJKqyC1LqJ
 DLWcdkA4P26jDyiXOdF8nKp2hKD5/9YFfbZF/vhFP+wdZcAu520i9q7kjUr6n2e/jY5iK6h
 o2w7duw5/BK6CCyXSzr0g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oBP13kVgXr0=;AWE+PSQo8NoymJhbQ+1sa4CXh2y
 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
 ez779SdA1wKga2WbT5RM6lsJGd8ruWqF8w==

> The write cases of debugfs entries are provisioning and bench
> helpers. By designs the MPQ8646 powers the CPU cores rail,
> so a wrong write can brown out the board or persist a bad
> setpoint into finite-cycle NVM.
See also once more:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.2-rc5#n94

* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.2-rc5#n669


Regards,
Markus
