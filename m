Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEF11C2BD
	for <linux-hwmon@vger.kernel.org>; Fri,  2 Aug 2024 05:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722575535; cv=none; b=nVXT/Vow89ZpBdGjQMK5U+IJdYsyf+lU1gKz0Nl9J/15CzV7KUxY+VB4uEW3fjqbQt6nZHg1ZTBepcRzYEoLIL5HshxXj87iD0j1/3RarL8y0Fw2pNrrVyveyX9QwUetQVOJYbEQOSB5a5LOGAFcFe1ZLIqkMgxLmlQPahqVGLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722575535; c=relaxed/simple;
	bh=sglRIUVHTwjkRn6qrR2VLhIlX3Pu31uOOuqK3CKVDIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RaP1+3yxbeTpNiMibwEkYdtBuYq1jBRc7UbnYo01dli7UHAMXWkBTH9QH601G/g+cxN4NFxPlQiTkYVM6uwTCS9dsRR+jEhkUNT7Xwdu35z229RYlM230gVjIQsSTaiJHse9tTT7ylsHc5D9jtmwBWcD8RIEK+gB9eaFK+/SAEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o7hYs8Wo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o7hYs8Wo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0159C32782;
	Fri,  2 Aug 2024 05:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722575535;
	bh=sglRIUVHTwjkRn6qrR2VLhIlX3Pu31uOOuqK3CKVDIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7hYs8Wo9mGZyH6BOYkY29pyO5eOEcM9FmUsX2GH0BqYVK6pKOz+7Kogg7FDhrzWm
	 5/XQ4gP6kndUOPTJkdd1gL76ePbTX41MPEE9KiUDJeLhVv7zwzbB+7DQ0JM3E8SW3D
	 /dZDE+9DAjqdMMabIGvefBv/pQNjN0MYwcsk+JOhA1ZxT4jcBwVU3I3HQ615xHtKRk
	 LC4hst4XuhkR0A0yvbFqXyIRQD+0YoJE+VVry0RKPHhN+4Qgo7KEjEcRVmbzS1LqpG
	 RK4dCw+FJW2ud0HYDBm4+gqFsg82CWyXsMn5e+ER+fI54fu9wyDw0vZlObTJyPTMAM
	 F59Pkxx4S1oXA==
Date: Fri, 2 Aug 2024 05:12:13 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 3/6] hwmon: (lm92) Replace chip IDs with limit register
 resolution
Message-ID: <ZqxqrX2j_01LZm9H@google.com>
References: <20240801144918.6156-1-linux@roeck-us.net>
 <20240801144918.6156-4-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240801144918.6156-4-linux@roeck-us.net>

On Thu, Aug 01, 2024 at 07:49:15AM -0700, Guenter Roeck wrote:
> The chip IDs are not used by the driver. Drop them. Use driver data to
> store the limit register resolution instead, and use this information
> when writing temperature limits to improve chip specific rounding and
> to avoid writing into unused register bits.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
