Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929FA33E4;
	Wed, 22 Jan 2025 07:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737532746; cv=none; b=omlQANAAE3if6/hT11cKA9LLzrvaOnbKtsZQQUJ3JyDqgXhPpyq2iCtW6DYWXaGInCuh/EmVdP0VyM4NivAnfn3G6qTBSx6xgzsBWdk0wA4VMlBaaZpI7KJg9G4NGOvcEzPXLczi1vkFjhiFT+rlHIqtiEayAW3kKrgIXePV/Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737532746; c=relaxed/simple;
	bh=ic/DEbSSonrmba7cuPGHN7m64fWkmPBtjGhdLLuTwOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKjd5kpua0MsZEks3nOdiw+heTzLqHaAc95Z34Tj1dvQg/wIS8MuMzgyYq6V+dIXxHK3xWWDh2KB4fZZsyysiYKTYPqc1NQ7J1JvQO5U+cqvZhrxe+H0WQfohjJhzYMwsAo+yQNGVNpGc5js28faoGjwx8DLz4xUkg8Chas+Vxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYukINsR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYukINsR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F8AC4CED6;
	Wed, 22 Jan 2025 07:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737532746;
	bh=ic/DEbSSonrmba7cuPGHN7m64fWkmPBtjGhdLLuTwOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oYukINsRDTeN6wJAZGD+Ax9Z0Ja7omeH3KZF+H4tgaExPt0kWmqqxnUE4phhn5glr
	 msqquGL+DGKk79Qf7Pzr6A3p0GzpGLIlL36CNiIEm9yj4pns95z9EiwBCdcanuWayf
	 9Lm0Ru+HhATEFGitxyKwpwDPSncON5itwxEyFxWx+8gwB3n22Jm+26O91DIY0sbu6h
	 1gwOciPUB4MNy3N+7lmS4QB9PwIvZepx5CqzLgY6aKfUyzZxjQ/karF8mrkg+Wh0dq
	 hJqmULVn/texoYomf/p+Xl8NeTNfteiNGJt8T6Re9KgHDKJ0eZZj5WBZYoHZxBPiVj
	 xRvlfbGtosrbQ==
Date: Wed, 22 Jan 2025 08:59:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wenliang Yan <wenliang202407@163.com>
Cc: linux@roeck-us.net, Jean Delvare <jdelvare@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings:Add SQ52206 to ina2xx devicetree
 bindings
Message-ID: <20250122-funky-beryl-whale-a8bcbb@krzk-bin>
References: <20250122012940.1005571-1-wenliang202407@163.com>
 <20250122012940.1005571-2-wenliang202407@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250122012940.1005571-2-wenliang202407@163.com>

On Wed, Jan 22, 2025 at 09:29:39AM +0800, Wenliang Yan wrote:
> Add the sq52206 compatible to the ina2xx.yaml
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> ---
> 
> Add the meaning of 'shunt-gain' in SQ52206.

You already sent v3... and you got comment from me. You ignored both
Conor and me, so me doing third time the same and expecting different
results would be definition of insanity.

Please read carefully submitting patches before posting new version.

Best regards,
Krzysztof

