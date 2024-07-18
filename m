Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3282B9D4
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Jul 2024 01:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721266128; cv=none; b=j/USiZ5XO2VYmKb2S/BDiyvaLQRqTiVd69J2065Ug36zazWb+Lf/I/CGBFnXAfait0Cfv7GCoujr8TXDGr+KfCm3roHQ0fh9srJmfgP2LiaypoEn9V8BBzfxZVQbHy/w5933ghGg58eyzdGFKts95OTpQ6oQRPc/hj6iSRNXtsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721266128; c=relaxed/simple;
	bh=ANqn/Og0Ir6Hv/57tEaNS7GCI29aOp5+3iy2oZV5G6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUG6ffisPv09yPAJcv/rx+n4nLCx7R3x3kY0q/FGWb8cgXFTXma0YXeDNmpRHf/29GJYuMNnuKBgn/Dut5/21wbZzlwp80D4CSPZwX3oSsZPD8Sd8Y3U7+mESWf38hkFTaw4KHIoNapbSafb3Xy6f+2gF6pYAnwWYe4vH4+RbIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oSaHuhOQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oSaHuhOQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4992C2BD10;
	Thu, 18 Jul 2024 01:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721266128;
	bh=ANqn/Og0Ir6Hv/57tEaNS7GCI29aOp5+3iy2oZV5G6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oSaHuhOQCCYiGQlG38Ues3ECS+piZojtG0HPDXWu0ozVM6wE/ezXO5TfuWhZ1xKVW
	 XM0BJt0514jD+V8ckgsjX6KMv1yoKoQJJvMpei1iD1gAQqw8JmoCpEWcWpmuhZOv0y
	 1rpXBxBdL4qRBwSb4QQVRGS+FlDSxmqjjjwPEdyO/4jXni8/r4fyfLAMOOlFFPnn66
	 PCj24N1hxXjhXNVjz3N+biNqT3MdEpYnomJVoGcQA7Tq52Q1kSOShnE88dQAoeurCG
	 u6iWBYwaNrqJKzHd3BtBtQVtt6y3ImyYIn2AzZzQX1lSq/X+3MFFOYnOLRHiupFNEP
	 PiHZZPKd5j9GA==
Date: Thu, 18 Jul 2024 09:28:45 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 5/6] hwmon: (max6639) Use multi-byte regmap operations
Message-ID: <Zphvza7uY2U5_YO9@tzungbi-laptop>
References: <20240716230050.2049534-1-linux@roeck-us.net>
 <20240716230050.2049534-6-linux@roeck-us.net>
 <ZpfIwpmmte8PUrjk@tzungbi-laptop>
 <ee004cd9-6682-4049-8cc8-f6389ce5c835@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee004cd9-6682-4049-8cc8-f6389ce5c835@roeck-us.net>

On Wed, Jul 17, 2024 at 10:14:49AM -0700, Guenter Roeck wrote:
> On 7/17/24 06:36, Tzung-Bi Shih wrote:
> > On Tue, Jul 16, 2024 at 04:00:49PM -0700, Guenter Roeck wrote:
> > > @@ -88,25 +88,16 @@ struct max6639_data {
> > >   static int max6639_temp_read_input(struct device *dev, int channel, long *temp)
> > >   {
> > > +	u32 regs[2] = {MAX6639_REG_TEMP_EXT(channel), MAX6639_REG_TEMP(channel) };
> >                         ^                                                       ^
> > To be consistent, either drop the space or insert an extra space otherwise.
> > 
> Good point. I added the space.

With that,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
