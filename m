Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA591B87C0
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 17:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776361565; cv=none; b=HI3RrcFz6Aj4X87VtBW1oKnDS0y8vX5Ho0S0WbAtrkHnWtfv8p9VBtz2/HBZ14bCthUc+tSsqI9z3ptl+AMmrwNi/QfdWoXiS/0To+cE6hi5VbLzD1OYkoONM3nmmMf2dYI6g1dW4oNkDTI0Z/H0/gZjp1d+bWfZ2msSzF048O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776361565; c=relaxed/simple;
	bh=wRSkLfcxxI60K4+Gdv3RJeMKnHTLNNxnmgVuhPXbhzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T7zKUTkIo6Y8pB05tP4LaslVMCaG9jTOwFZ9EXyi6is5xhXgrWlN5/7UyCpQoyTaDRlfNKATM3SVWygLVfm1jhsnPYqFTJKaUtU7fv2PCW7oAQDKFw/pfpzNTK1cTfnZHkHmApfM3gN3r8szor19AxB6vaRtv+NKy8pvm94lHRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fOTUkpnf; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fOTUkpnf"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776361562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hHrCtpMITWLNXcE8f7X9uNRRlALPyi+stAXMDLaH5G8=;
	b=fOTUkpnf3ZAy2h749K+cZfBPw83econdG91pjjSTWNDvwU/W5JFU9PX5VOqUIwbsun5ug8
	6xDvmemAsh11DuBQLXnNfSkRErClyOiV0xnNTbAgc9k0xhRAY1gSH5WibhJkbX/LbbCR7U
	GsS9Ylty+TWWmzJvYivsdX1z265zicI=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko@lists.linux.dev,  Alexis Czezar Torreno
 <alexisczezar.torreno@analog.com>,  linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: add max20830
In-Reply-To: <20260416-winged-ivory-mandrill-f1e8b3@quoll> (Krzysztof
	Kozlowski's message of "Thu, 16 Apr 2026 11:25:26 +0200")
References: <20260414-dev_max20830-v1-1-210d3f82c571@analog.com>
	<20260414043841.1ED2AC19425@smtp.kernel.org>
	<20260416-winged-ivory-mandrill-f1e8b3@quoll>
Date: Thu, 16 Apr 2026 17:45:52 +0000
Message-ID: <7ia4mrz2ssrz.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Migadu-Flow: FLOW_OUT

Krzysztof Kozlowski <krzk@kernel.org> writes:

> On Tue, Apr 14, 2026 at 04:38:40AM +0000, sashiko-bot@kernel.org wrote:
>> Sashiko AI review found 3 potential issue(s):
>> - [Medium] Incomplete Regulator Schema
>> - [Medium] Missing Hardware Capability (Interrupts)
>> - [Low] Devicetree Best Practices Violation (Node Name)
>> --
>> 
>> commit 20a4d8dcd2f3344ac22d7d2e974bae1ef57874ed
>> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>> 
>> dt-bindings: hwmon: pmbus: add max20830
>> 
>> This commit adds device tree documentation for the MAX20830 step-down DC-DC
>> switching regulator with PMBus interface. It allows monitoring of voltage,
>> current, and temperature.
>
> Sashiko devs,
> Can we drop such comments? They are useless - we know what the commit is
> doing, no point for reviewing tool to say it again.

It's the format which originated from initial Chris Mason's prompts
and as *I understand* it's purpose was to make sure the llm is reviewing
the right patch and more or less understands it. Idk if we still need
this, but at least some find it useful: e.g.
https://github.com/sashiko-dev/sashiko/issues/90 .

I'm planning to do it configurable in UI, but for emails I can
only make it configurable on per-subsystem basis.
If there is a consensus amongst hwmon maintainers, I'm happy to remove
it for hwmon (in several days).

>
> Please send only useful feedback to mailing list, otherwise this will be
> just noise and going to be ignored.

Agree, but there are many sometimes conflicting opinions on what's
useful and what's not. So I'm trying to make it as flexible and
configurable as possible.

Thanks
