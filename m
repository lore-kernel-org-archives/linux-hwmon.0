Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F239217580
	for <linux-hwmon@vger.kernel.org>; Mon, 22 Jul 2024 05:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721627238; cv=none; b=MhtXpwYePQPRwZO0JsiKvKGzBhwGiD0HU6UvCNuKIvvI9RDPsAK7NBiRqeSuv9m4pCo7Ajf7bODnWLeiz/3PUDWGPTfxdXHjQDdylPFX/XvwIhqhYKLTNZmyrN3DY35ruK0ZaMn/QbyY8ZLVV5lJCg8YwW6bD/NCZQBE6gtXJcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721627238; c=relaxed/simple;
	bh=D6KnXAX45OC2vIuk0F8OFqhTdvYNuNyCAKPZZ5aPzGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LXPLIpOvhfyOuUrFGa/Rk3V7yBw7dOlqEBSG+vEThlxb0Fuys7+fWECe0nrG1dbDCWg30uv9Lx0IbE73VxopfG0KrIGtQ3eCMZjwrsL6l8mDoeMWb59sCIJD2Xh1+QEpRGY+kk8GAvgxZMnY+8gDGp0QW8wqU5MuRli6gVLAm7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lg6CXV9t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lg6CXV9t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA00C116B1;
	Mon, 22 Jul 2024 05:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721627237;
	bh=D6KnXAX45OC2vIuk0F8OFqhTdvYNuNyCAKPZZ5aPzGM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lg6CXV9tnz3zOscMBi0sm19Vi2H6ru8ZpTsUfddY6DCltvz2RKp3BtRnoMlSDBIrv
	 GCFbGtBryriN5zlrYUHAcqiBkhFx7djLlhay/2bvQGhptRX5i3nTO6OsFbM+LKTZF1
	 0KMl3SCaqVVYyYWMDf/cQoeVC6RAoAdBy/YlA1gCb5K03nsaKqbt+ocsQCvWP/05ZR
	 eJuBou+n12KdaM0zevHMmqZ4LzMDFta49qoaaB321wdvHAVmTIEHx7nHigSZJoim+0
	 Lktv6kIuI7ef5iEiaOPW0WlJ7rCjSXkv3qczuTHjW9e7wcdglUbSqi45knScHCkpUU
	 GdhsBI/joMePQ==
Date: Mon, 22 Jul 2024 05:47:14 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (max16065) Fix alarm attributes
Message-ID: <Zp3yYg6eA5_UVgCq@google.com>
References: <20240721193506.2330006-1-linux@roeck-us.net>
 <20240721193506.2330006-2-linux@roeck-us.net>
 <Zp3ScBZOJQixuFN9@google.com>
 <3335085f-7ab5-436f-b358-f53a3763b63b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3335085f-7ab5-436f-b358-f53a3763b63b@roeck-us.net>

On Sun, Jul 21, 2024 at 08:48:51PM -0700, Guenter Roeck wrote:
> On 7/21/24 20:30, Tzung-Bi Shih wrote:
> > On Sun, Jul 21, 2024 at 12:35:06PM -0700, Guenter Roeck wrote:
> > > Chips reporting overcurrent alarms report it in the second alarm register.
> > 
> > I can't understand the sentence.  Not sure whether it needs to be rephrased or
> > not.  s/overcurrent/overvoltage/.
> > 
> 
> No, it is over-current. Not all chips support current measurements.
> Those who do support it also support reporting over-current alarms.
> Over-current alarms are reported in the second alarm register.

Table 16 in [1] and Table 11 in [2] use "overvoltage".  Please ignore the
comments if I'm misunderstanding.

[1]: https://www.analog.com/media/en/technical-documentation/data-sheets/max16067.pdf
[2]: https://www.analog.com/media/en/technical-documentation/data-sheets/max16068.pdf

> Do you have a suggestion for better wording ?

No, or I guess I can understand the sentence strucutre a bit now:
Chips (reporting overcurrent alarms) report it in the second alarm register.
