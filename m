Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0E912E42
	for <linux-hwmon@vger.kernel.org>; Thu, 22 Feb 2024 01:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.19.156.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708564254; cv=none; b=cVm3B6wRXiS5GyR8zVZz3/Pzih8rX3APJ6PXUslYFGKJtHfopc5wUOcBPFXTjEu3+aYIJTdryLceXH5UgvbMb6RINd9VEIKgzjgaA6V4nLWiF5a92E+r1fwLWrsrmICpd9unsSjwVdnvIwXD8897LZZ+s323Hw2h+natUtw9Wxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708564254; c=relaxed/simple;
	bh=bLQTGNm+Hx7GjPswZDA8ZQn759Pc4094sxQdFigcAV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzKHqWHD00EVAfNvBHULRfhIAwWkFYfOOIMNTTEdr3j3R3YlNxGLfJOLVAdh87OJS8l0lCGdnnLVwWGYpyNd8rn2I5o8CzpuU1gycJvNDttFhFFbfi6E7plifDMScqmKy0d75DE63VOkWKY30kJmudLnmS+3+PUuUpvJldYo99k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net; spf=pass smtp.mailfrom=bewilderbeest.net; dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b=E9eRaBST; arc=none smtp.client-ip=71.19.156.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b="E9eRaBST"
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:712b:6300::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 6D49C73D;
	Wed, 21 Feb 2024 17:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1708564252;
	bh=Xvg58GvfvE1rEr3g8HA+QoASN3LRJZ+Bw65qRmPUQYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E9eRaBSTOJA+rvvFurtTcnrVMa9xWAApVholTDIT8sRs+U/iOv5Apj/Jm3XS60oC4
	 S4Jn/gs+6KFHPvMs9xmP2GBOjjR4Rj2OtKgRFD5Iem5H36vdXym7zY8DTlocUdDv4C
	 dO1s5KmtNBy1BT9oj9ViGbIOidaB4e294+80lcPI=
Date: Wed, 21 Feb 2024 17:10:51 -0800
From: Zev Weiss <zev@bewilderbeest.net>
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Patrick Rudolph <patrick.rudolph@9elements.com>
Subject: Re: [PATCH 0/3] hwmon: (pmbus) Use PMBUS_REGULATOR_ONE to declare
 regulators with single output
Message-ID: <64a2b474-8080-4da0-a37d-7577f9dcd81e@hatter.bewilderbeest.net>
References: <20240214194342.3678254-1-linux@roeck-us.net>
 <20240217-sliced-company-6c6fa2a40369@spud>
 <20240219-rigging-strive-fd54af33253c@spud>
 <b4265631-1835-4b9b-86a0-62b404cca5ae@roeck-us.net>
 <20240221-founder-upward-3464de32031c@spud>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20240221-founder-upward-3464de32031c@spud>

On Wed, Feb 21, 2024 at 11:06:53AM PST, Conor Dooley wrote:
>On Mon, Feb 19, 2024 at 07:13:33AM -0800, Guenter Roeck wrote:
>> On 2/19/24 06:48, Conor Dooley wrote:
>> > On Sat, Feb 17, 2024 at 10:00:30PM +0000, Conor Dooley wrote:
>> > > On Wed, Feb 14, 2024 at 11:43:39AM -0800, Guenter Roeck wrote:
>> > > > If a chip only provides a single regulator, it should be named 'vout'
>> > > > and not 'vout0'. Declare regulators for chips with a single ouput using
>> > > > PMBUS_REGULATOR_ONE() to make that happen.
>> > >
>> > > If we're gonna do this, we should go ahead and document each of these
>> > > regulators. If Naresh sends a v2 for the tda, I could do the others.
>> >
>> > As it turns out, the infineon devices in question are not PMICs, but
>> > regulators themselves. I think something like the following is what we
>> > need. Perhaps Zev or the 9elements guys can comment.
>> >
>> IMO The lm25066 patch should be separate.
>
>It should already be a pair of changes - one for the infineon stuff and
>another for the ti devices:
>
>> > commit 9cf2671c0b98c0a0dd599fe9152985d1320bf320
>> > Author: Conor Dooley <conor.dooley@microchip.com>
>> > Date:   Mon Feb 19 14:24:48 2024 +0000
>> >
>> >      dt-bindings: regulator: promote infineon buck converters to their own binding
>> >      These devices may need to make use of the common regulator properties,
>> >      but these are not permitted while only documented in
>> >      trivial-devices.yaml
>> >      Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>
>> > commit 597739840d2bc95ebb884d7f5fc4f3cc206d9af6
>> > Author: Conor Dooley <conor.dooley@microchip.com>
>> > Date:   Mon Feb 19 13:29:12 2024 +0000
>> >
>> >      dt-bindings: hwmon/pmbus: ti,lm25066: document regulators
>> >      All devices documented in the lm25066 binding are intended for use with
>> >      a regulator, be that for purely monitoring purposes (lm25056) or, for
>> >      the other devices, as the controller of that regulator. The binding does
>> >      not currently allow regulator child nodes, so add one.
>> >      Each of these devices interacts with only a single regulator and
>> >      documentation refers to it as "Vout", hence the choice of child node
>> >      name.
>> >      Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>

This looks fine to me -- as far as the lm25066 patch goes,

Acked-by: Zev Weiss <zev@bewilderbeest.net>


Thanks,
Zev

