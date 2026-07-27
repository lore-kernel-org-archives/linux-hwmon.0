Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B9E03DB620;
	Mon, 27 Jul 2026 07:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785136462; cv=none; b=TPXWDuWksqMg+Qw+/jAXbA3MQo+OqwRvCf++u0r5FM1zNIvv4rslR5+leImfozRtX5gu5UkN+Bn6NA7VsfrDsnHxfv+rjj4nFA6E1qDu9aem9NAXr3Qj80tdW/g9weTD5JXEBjb/kQwRbN5faSIDAwMf3iea8+8+W5eAcHf8aBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785136462; c=relaxed/simple;
	bh=XdOyEd0LAplQA9n9G/BQphkUCKQAxnRzMXZEdXgYw3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KPFf/87gLJ8nfK1zV1qgwhcYebe2yk8C4aHKDZa7FvuwwP8lTjbrvtIWpONgeDWwEC9jJhZgbT3ZVHS00+JJ9+G+/v3w/5JYBsez32j3TlQrVIb61X22RbhRlfcVdzsyB3XlffdQQWpsSuyefi80cvQWBYap9okZtLgiS3q5tWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYX8ykz+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYX8ykz+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4321F00A3A;
	Mon, 27 Jul 2026 07:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785136461;
	bh=VAFps9UsHnJ0kmXjkrsyluLdICMHHuE1kuSX4UNRNUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KYX8ykz+g5TDPRd+MBnhj+QA8npOs3CBD4lB8FOXeFU6wlIhOKeBuZcGAjC6FDikZ
	 lQk6EaLxZ/uTNgnTLlsqX+oBpqXsDqCwrxVQoykla4wOCcM7Rb33jYTO01UPP8ZBLN
	 ovQgSNUoyahqc6zv8hJEmky/c7lo2fUBlQt8r2H/FHcKRyLnHbbYlk3FlcnNXmwCym
	 AbQOY1n+SwTKD5oq9LAZAtQBig6CsdEfaT3URKRUUS1EAOztp16YKON7TidpqYDiuL
	 IADvaqSzKoNhlkMEgzWycdnZZDXhb+hgJVr5Jjw/QX57/+JffoSQogF2qvGc8tUazu
	 L7NoFwlVT6llw==
Date: Mon, 27 Jul 2026 09:14:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: Add vendor prefix for Kandou
Message-ID: <20260727-space-skink-of-chivalry-95eadc@quoll>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-1-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-1-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:37PM +0800, Andy Chung wrote:
> Kandou AI is the vendor of the KB9002 PCIe retimer.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

