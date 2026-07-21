Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2F23911CF;
	Tue, 21 Jul 2026 08:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784622261; cv=none; b=k/KuX+tICugxAVJ15HidR0hrit898xI4BIGAclI1H3ogYtp8aYbah8URQKA+JSYEWVwFNRFqLM2X0UmJTJSZ2jWEYeSTndhFBQIxZ5aBKr2HSSBD25rCvAXVC+OAyVWbJDQfVVDo7sU5hKhucsAxc7AXGwNoOIwKp9VgUK0JlTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784622261; c=relaxed/simple;
	bh=E/2No778xRVwk4IG8w2quuSN/W3ZFnw3sBkLAiWxOJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJIxwGBn5LVfgRjfnvsZDiBnk1u7W2VlB/I4K9q1UkseB0Bo6yL32jwXRg/62mFjpMTS7tmeCeecuEqlOgR91iu0t+J/Cg9Ox8EJmLW6RBWFHZ83LF0r1UORTxhu2yFPxiczyv9f/sVO1IR8gZ2bpPoQGvkDbKBIYiq8dyvXz/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fRLa+Oyb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fRLa+Oyb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68971F00A3A;
	Tue, 21 Jul 2026 08:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784622259;
	bh=hf2g2fMGfujqKzrSPDThvxpq2W8xwRnJ8suYjZkN4C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fRLa+Oyb3Zu6xCw7S4c7whpMig4DBMwE8QsYIjge730I8OBzKlnVy5gjI/HpOGI6O
	 RcGecuHGQ/cFNu5h9BFYm4hbH8+/4lA0+OQZkG+kvpD2u5f1BQ9YRmY7FiBq/9V+Bk
	 EEeZebXU4ARa1cgQah/jjXlUaM01Fm6/h0UGKEOjEOasL7RDPXdiTi4Zsw6VgeQq53
	 QcFs1wNgAFXPdo1e20a8el1KO3rxRXaUAmbdZ+fK573rhfFe3lYNxEl2obDgW2WFxp
	 PelDTUeEG+sx/otWUec/L6c8zK0AW40eo0fpfrNR5eFEzLZNDuksfbUYKzTRlilUX6
	 OSOkAqJ5ynT1A==
Date: Tue, 21 Jul 2026 10:24:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: Add vendor prefix for Kandou
Message-ID: <20260721-sweet-bulldog-of-perspective-bd0bcd@quoll>
References: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
 <20260715-kb9002-upstream-v2-1-2fd390383da5@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715-kb9002-upstream-v2-1-2fd390383da5@amd.com>

On Wed, Jul 15, 2026 at 05:08:35PM +0800, Andy Chung wrote:
> Kandou Bus, S.A. is the vendor of the KB9002 PCIe retimer.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

What's the domain or ticker name? I find only Kandou AI, so not the
"bus" variant...

Best regards,
Krzysztof

