Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECA41ADFE4;
	Fri, 10 Jan 2025 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736498215; cv=none; b=mTpWLF9S9exCbO+iA9nesQSpFgBMlw9Sqnc7XuUGhTCYg0FY2vOA8Jw8+jmmokokuxwtJYwwLYhrRgt5w7DfCvXx7qndxDKSEavt/ZFw4bBSF/6P07rdUOfDHQZdOnHpRF/5oG0VD7holRzE7aQvQhhFjotL2ITkeHZrQQSPSyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736498215; c=relaxed/simple;
	bh=0nMT0czq+QV+lXjsmvxpiof08d2/4souiJ7M7uwZ/n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZKh1GNN94iXzwzdoHZGI8Dm5W0p2SQJ3OVroqXPG3U6IAdkUR0RlzMPbcG+Olq3ahuFIs+8x9bwK+E/PqJsUEel4k9a/KkNloDyZO9g2i9cYQB5Pm1DluGdoQjoqG2xRCGWcOznNrFuIFxVHTvjKzfhkN5IyjFq9CeJvoTiZipQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/PNZKYm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/PNZKYm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9578C4CED6;
	Fri, 10 Jan 2025 08:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736498214;
	bh=0nMT0czq+QV+lXjsmvxpiof08d2/4souiJ7M7uwZ/n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/PNZKYmapZ7llWPrBIMtFlpQPrbTWVJYreddZCqh7DQKJxjgLPwtezbSlqf1JPIT
	 ajmIkNWl34cECKLsduqh7lM135O/eWTmrKcgP7/j7blV6sChTEIgQKa1OJMtmWQ7oo
	 5mIf5XwIPG7m4iJ63LQIa5/hhW6cEuNDnnVnTwtAkoDOtV49SqKZ5QgKiKEHsmQTz+
	 TngccmEH6UAkvNiQQDqxx9Sb6YDOrMX3ET7Fu3pd+2/KgP6E3GLRxf0fSv3jQNWrdc
	 vW/9FsCPYxhJorBeMKJ6zEuTEV4lALmo0MdnXdXrLwav7lE/602s9/q3tHRP2yWAgF
	 igTs6DjfBpUNA==
Date: Fri, 10 Jan 2025 09:36:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leo Yang <leo.yang.sy0@gmail.com>
Cc: jdelvare@suse.com, linux@roeck-us.net, robh@kernel.org, 
	davem@davemloft.net, krzk+dt@kernel.org, conor+dt@kernel.org, Leo-Yang@quantatw.com, 
	corbet@lwn.net, Delphine_CC_Chiu@wiwynn.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: ti,ina2xx: Add INA233 device
Message-ID: <pmg3xfdr2tu4yaed5hmi3ttj43gqmgzguckbfonr24o6l33pem@nfuxw3cbkzt2>
References: <20250110081546.61667-1-Leo-Yang@quantatw.com>
 <20250110081546.61667-2-Leo-Yang@quantatw.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110081546.61667-2-Leo-Yang@quantatw.com>

On Fri, Jan 10, 2025 at 04:15:45PM +0800, Leo Yang wrote:
> Add TI INA233 Current and Power Monitor bindings.
> 
> Signed-off-by: Leo Yang <Leo-Yang@quantatw.com>

Also, SoB does not match From.

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

Best regards,
Krzysztof

