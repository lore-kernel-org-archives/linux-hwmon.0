Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C262D1911;
	Wed,  3 Jun 2026 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780474327; cv=none; b=BvD53Q8tPkb9O5MdIiz6kICAN7L1HlFZx77RcPZQQH3v5dsaZgtzRwpGY8OeOxsgtpmwAGdV/x2wGem0DQvzkzN37+Tmbt+nyUrsVytXQjwouk3Ow7dnGPRprVNKHvlBExKNg53DpneMGp/6uI5vivxolqFDwbdycKRqkZjPS8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780474327; c=relaxed/simple;
	bh=+/bRzcE69UTTerm5h4iLYVNNG3eY5R9UdbVCCHb6kks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4LNyxKz0U6BYpLwcWSPSX6Ztir3JFtZpGOOG6khCZjwj8fMVbzs3GydfdJNIzzpAGQ/IlOzPZs9rt+gyOZMOA8/eBZQrg16YOl6xN5m0BLEEJMrIA/hCs5Aq31Xha8QccOxRS1gXIvVTIV7odV/Lub97XkqLvp6Biv6T+L9EUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYmZoB1d; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYmZoB1d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780474325; x=1812010325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+/bRzcE69UTTerm5h4iLYVNNG3eY5R9UdbVCCHb6kks=;
  b=iYmZoB1diSb6J+2P1STyjt+65sRyCWgL7OhDOz7V993RnEgBvhnOFB3e
   n+fnLwwcgsysm3xVAIU8Q0cg0d3/TjmoJBOPxqqlnZtOoINpM7N2iTxaB
   yInF5INO0IwqyHJgf8rprsDMbYi9TEHTi9RY+89iD5UPQZI6vbur/nOev
   7Ss/vzx/ROfX94czDNjCAxHJgvSs2fxryp50QBLBh9RBw41EN7XOb965e
   6py+k+V5RbF3y5bO3/W01Q8WyE/qVRFOsB6zuBgkMBFXEXFLm/pEOhS60
   ATrGaJ2DGUN3MGLQ3h11mvguXZBWoboztOQ+8tEihWSG0bJVG2B2B3x3k
   g==;
X-CSE-ConnectionGUID: mvLqhjDuRWyfYAcdMcQu6A==
X-CSE-MsgGUID: kFmuk2u/QdKekEO4HwcK4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81304333"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="81304333"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 01:12:04 -0700
X-CSE-ConnectionGUID: 9eIrhLwGRCu0lZcJHlEqyQ==
X-CSE-MsgGUID: n1Hlh6oyRPe8FWGZPp0otA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="249080524"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 03 Jun 2026 01:12:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 0AB5295; Wed, 03 Jun 2026 10:12:02 +0200 (CEST)
Date: Wed, 3 Jun 2026 10:12:02 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux@roeck-us.net" <linux@roeck-us.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v2] hwmon: (tps53679) Fix device ID comparison and
 printing in tps53676_identify()
Message-ID: <ah_h0m1JTCzJuLlY@black.igk.intel.com>
References: <20260330155618.77403-1-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330155618.77403-1-sanman.pradhan@hpe.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Mar 30, 2026 at 03:56:40PM +0000, Pradhan, Sanman wrote:
> 
> tps53676_identify() uses strncmp() to compare the device ID buffer
> against a byte sequence containing embedded non-printable bytes
> (\x53\x67\x60). strncmp() is semantically wrong for binary data
> comparison; use memcmp() instead.
> 
> Additionally, the buffer from i2c_smbus_read_block_data() is not
> NUL-terminated, so printing it with "%s" in the error path is
> undefined behavior and may read past the buffer. Use "%*ph" to
> hex-dump the actual bytes returned.
> 
> Per the datasheet, the expected device ID is the 6-byte sequence
> 54 49 53 67 60 00 ("TI\x53\x67\x60\x00"), so compare all 6 bytes
> including the trailing NUL.

Your patch seems okay to me. But just for your information I would do it
differently. Id est the sequence you got for the comparison is the perfect
ASCII one, but this is a coincident as the actual ID is in FourCC BCD.

The better check is to compare first two bytes to TI and device ID separately
as FourCC. Do you want me to send a patch or you can do it yourself?

(Also note that there is no need to use *ph as we know the length and it's
 always the same, so %6ph suffice, but again, you want to print the FourCC,
 %p4c.)

...

>  	ret = i2c_smbus_read_block_data(client, PMBUS_IC_DEVICE_ID, buf);
>  	if (ret < 0)
>  		return ret;
> -	if (strncmp("TI\x53\x67\x60", buf, 5)) {
> -		dev_err(&client->dev, "Unexpected device ID: %s\n", buf);
> +	if (ret != 6 || memcmp(buf, "TI\x53\x67\x60\x00", 6)) {
> +		dev_err(&client->dev, "Unexpected device ID: %*ph\n", ret, buf);
>  		return -ENODEV;
>  	}

#define TPS53676_DEVICE_ID_MAGIC	0x53676000

	if (ret != 6)
		dev_err(&client->dev, "Malformed response\n");
		return -EIO;
	}
	if (strncmp(buf, "TI", 2)) {
		dev_err(&client->dev, "Unexpected vendor ID: %2pE\n", buf); // use %pE since it maybe unprintable
		return -ENODEV;
	}
	if (get_unaligned_be32(buf + 2) != _DEVICE_ID_MAGIC) {
		dev_err(&client->dev, "Unexpected device ID: %p4c\n", buf + 2);
		return -ENODEV;
	}


-- 
With Best Regards,
Andy Shevchenko


