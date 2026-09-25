Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9661A49E148;
	Fri, 25 Sep 2026 13:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341233; cv=none; b=HehCZroO92Ud2ek8Ah875Aky/BOpypZYF8urHSUZvOGbaYYAqC3RzatLt9C/0mXnoH1eqw0xGPuuXEl2wQMuAdaLcI7ZAIDHj2snI1E2u7QwYGvka7pbhsFpm491XuN+kHWExfQwzpfV2a0gTJsGnU120q45Zso0xbatBKid6No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341233; c=relaxed/simple;
	bh=N8T2UjG/a83iwuSVvtrY4qQhZTowjTvaoQ29IZhvja4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6f/PeCeiPM1L212sSwnPsA0BIqFiXM5zXUiv5aMsB07Oy4XCN3OTE3r4Ss9lfEhyfSraQaJYTVJzmfYOn31i4W3IlvPrr7CIuGAsgWEwwjkQCRkHkMke2hGvAUsR2VugmzjEvKatRXvgjTm7jcMNEdEH6qOogiGTcIG7dJoq98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuUoOjj3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuUoOjj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1661F00893;
	Fri, 25 Sep 2026 13:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341232;
	bh=b86/P4zYiVgKXV2M7Ro3599WggJYNFJUbrhgeD/H32k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HuUoOjj3QAdbe9BDUUn9aJJNmdkLcz4taW4bJV45Za0PT+K+bTs9CrTb4Homy8CM7
	 nF4Mk75YpRh5t+nRo+ZXkHJ8yNGJjKlEiaK59k0WaPCSgleCTb7DUBi1ttdVpumUxU
	 NO+/ORvRkh0hQhpe3sn1fG7k/TKcyC4v2smh4erP+jZ6ZyoBjH/+BdAY7+dEPkl2O1
	 6aNUyChprDKnwCv47ZcDUF8ztDz5497J/HA/Z7f0Oxul2GBRU9Xn1W9XEEROrVz4GR
	 SSBwhNNBy6Gfbmv9Ophvo1Rr3SVT+mT21wCPcqetOLS8o1zdLAISv6+U5GIcRzEmfn
	 g9rum3KMvIGsw==
Date: Fri, 25 Sep 2026 15:00:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: ashish yadav <ashishyadav78@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ashish Yadav <ashish.yadav@infineon.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 0/2] Add support for Infineon Digital Multi-phase
Message-ID: <20260925-ruddy-gibbon-of-eternity-d2ebd2@quoll>
References: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
 <CAJKbuCZ1733m5UKXNwOV-3WBYNOFbgUA7QUfhAY51yskv6z-Aw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAJKbuCZ1733m5UKXNwOV-3WBYNOFbgUA7QUfhAY51yskv6z-Aw@mail.gmail.com>

On Fri, Sep 25, 2026 at 12:01:28PM +0530, ashish yadav wrote:
> Hi Guenter,
> 
> I hope you are doing well.
> When you have a moment, could you please look into the patch to add
> support for the XDPE1A2G7C voltage regulator?
> I would highly appreciate your review, feedback, or any guidance on
> next steps when your schedule allows.
> Thank you very much for your time and continued support.

Don't ping after four days. We do have some other tasks than
reviewing your work. Not mentioning +200 more patches in queue. Why are
you more important than these 200?

Ping after two weeks, better resend.

Best regards,
Krzysztof

