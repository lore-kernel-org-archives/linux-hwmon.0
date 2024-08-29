Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96E1AE05A
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Aug 2024 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724943233; cv=none; b=hu9ab0EBZ32uMeb54dRzBGs6q3ycsnJ0aXq0l77y5nUXqE8NVAjSnnjA3jIPEKOTOhD2H6U3GI8UaoaTm4xyhbHHozx0jtVbMoVWYMJ4cXB0vDtoDix01JrNzryU3mPXhHa93HKDMeaVUvloz+rZlv8S6AJuXYj/BDv1wAPsG7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724943233; c=relaxed/simple;
	bh=uzZcvyPTKG7NjnCVbJUj8Jn9KQ3N/zuP3kPyV/V1M9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mb/DPxJ3TWnG3YCUrJgH7R5QMS1+SPvdwYXT8P0qlGOIiVnPlEaS+QwhEXw7k5rjP4IktYANLhI/ycQVtUH6FV19zmTL1bqWUee9ptSvz1qXgtlEvhmINp1DHu+OTjVf/MZXiTaOmw6sD460aXvbhQj9OW2/Vcr4gqshtFGX0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVrgbwTn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVrgbwTn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01411C4CEC1;
	Thu, 29 Aug 2024 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724943232;
	bh=uzZcvyPTKG7NjnCVbJUj8Jn9KQ3N/zuP3kPyV/V1M9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iVrgbwTnSyLaqjSKptxkrYMVKVD9PjT6Xz8o2Z83i/BJFd0v3FA82biZ+vnt9mEDx
	 9n0cJDD4OAEPQ+doC9OsQWA3MXA4NZ5EJ3k9OV5z7zPVGTjc36AvTMetGWIsb585/N
	 e3P2j2Tlt8heksqrpQp6J4Gjqgw3RHAjpqAAcf8TyWo6+D90vIt0upqEUHjLcLnm7R
	 QBXrE1sUJ0LVQnKFV96KYIb6KacX3tgqpFG7edFWs+OPqw416rOSmDihRPEXWDxwug
	 HsgHixxaKk3gIg6fIGxgEitj8fte7qrQ3JbmkxT7TYhSBZXrZ+4P4/edmZcdb143J9
	 QovxD6rFOeDIw==
Date: Thu, 29 Aug 2024 22:53:49 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 03/11] hwmon: (ina2xx) Use bit operations
Message-ID: <ZtCLfdabXCHzmzts@tzungbi-laptop>
References: <20240827153455.1344529-1-linux@roeck-us.net>
 <20240827153455.1344529-4-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827153455.1344529-4-linux@roeck-us.net>

On Tue, Aug 27, 2024 at 08:34:47AM -0700, Guenter Roeck wrote:
> Use bit operations where possible to make the code more generic and to
> align it with other drivers. Also use compile time conversion from bit
> to mask to reduce runtime overhead.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
