Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF8822A1D4;
	Tue,  7 Jul 2026 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443146; cv=none; b=QH+BUoDB6bG8Q9cRIV/LCv9RzpVsBdGFjI3cK4DTHTUAq4OF1DWbZwI+ffU9KM+nU+Ad7V1sGF6QYdLJc68wUsO5E3Sg1we/g0E8oRLKKgzWQzkdZYfNNYMOHxf7g4gwaKF8JNHUmAHki+RNk25rzORAlfQW+u2YZbiuNNqbr6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443146; c=relaxed/simple;
	bh=S9akPf+DegVaj9HNVeK9vMrAnXzC3uRuJr7h/bUwRYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUa1y0JVaQCQYfmYGOqwTs4udp0MdNJ+folvSfR9C23VqXX8G77MYWsPq5CuEWKwwyVDZCzvjG3HM9wXwy9trOzPiolJSCSrIG/u6Kmbu06/RdlpH6Il+c+0fmK97r4JQFGxcq/YBYnovUE4yFFIT2NFP2ZwDD0uzyc0YizFf5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=eo0587uf; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="eo0587uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783443143;
	bh=S9akPf+DegVaj9HNVeK9vMrAnXzC3uRuJr7h/bUwRYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eo0587ufepS5Wk/tWdfigsUBpp84dAEKbsNUMvXhupiTiDUrXbA0qqt4LcjZDQNRX
	 EfaoCFHUyj3vqzwAboyHHo3I1JOpq7EBjy5HNYm+Su8nTckBNEZNEdObRhVZFjUM54
	 qF51dEqt74HTYtZXwtIukgM8nP/bo9N8FgHWVc+w=
Date: Tue, 7 Jul 2026 18:52:22 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (cros_ec) Handle temperature conversion
 overflows
Message-ID: <2b1c29c8-bf87-4113-ba1e-63e1b1d1ff51@t-8ch.de>
References: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
 <20260630-cros_ec-hwmon-overflow-v1-2-3d2ecd3eb0f2@weissschuh.net>
 <7b5145a6-7054-40c7-af49-1f2415d1b83f@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b5145a6-7054-40c7-af49-1f2415d1b83f@roeck-us.net>

On 2026-06-30 16:06:04-0700, Guenter Roeck wrote:
> On Tue, Jun 30, 2026 at 10:57:52PM +0200, Thomas Weißschuh wrote:
> > The calculations converting between the different temperature units can
> > overflow, resulting in incorrect data.
> > 
> > Detect these overflows and report them.
> > 
> 
> I did not see how this can happen in practice, so I asked an AI agent.
> Its response is below.
>
> Given that, I am not going to apply this patch. I am all for checking
> against overflows, but only if they are real.

They can happen on 32-bit architectures. 
So my idea was to have a single shared algorithm for which the compiler
will nicely optimize away the impossible cases.

(More below)

> ---
> Yes, an overflow is possible, but only on 32-bit architectures.
>   
>   Here is the breakdown of why this happens and its limitations:
>   
>   ### 1.  cros_ec_hwmon_read_temp_threshold 
>   
>   The function  cros_ec_hwmon_read_temp_threshold  populates the  threshold  variable using  resp.temp_host[threshold] , which is an array of  uint32_t .
>   
>   In  cros_ec_hwmon_read , this  u32  threshold is passed to the conversion function which takes a  long t :
>   
>     static bool cros_ec_hwmon_kelvin_to_millicelsius_overflow(long t, long *ret)
>     
>   • On a 32-bit system:  long  is a 32-bit signed integer with a
>   maximum value of  2,147,483,647 . If the EC hardware returns a bogus
>   or uninitialized positive  u32  value (e.g.,  3,000,000 ), the
>   multiplication  t * MILLIDEGREE_PER_DEGREE  ( 3,000,000 * 1000 =
>   3,000,000,000 ) will exceed  LONG_MAX  and cause a signed integer
>   overflow.                                                           

This is the case I want to handle.

>   • On a 64-bit system:  long  is a 64-bit integer. The maximum
>   possible  u32  value multiplied by  1000  is  4,294,967,295,000 ,
>   which comfortably fits within the 64-bit limit of  9.22 x 10^18 . An
>   overflow here is mathematically impossible.                                                                                                                                                            
And the compiler knows this and optimizes away the overflow checks.

>   
>   ### 2. A Quirky Edge Case on 32-bit
>   
>   If the EC returns a standard error state like  0xFFFFFFFF , the
>   implicit cast from  u32 threshold  to  long t  on a 32-bit system
>   will result in  t = -1 .

This "standard error" state does not apply to these values.
'0' means 'disabled', all other values are normal values.

>   Interestingly, the new  check_mul_overflow(-1, 1000, ret)  check
>   will not trigger, because  -1000  fits perfectly inside a 32-bit
>   long . Instead, it will silently return a bogus value of  -274000 
>   (which corresponds to -274°C). The patch does not actually prevent
>   this specific "incorrect data" case.                                                                                                

This is a bug in my code. I'd like to fix it like below, so the compiler
can optimize this away on 64-bit, too.

                        if (ret == 0) {
+                               if (overflows_type(threshold, long))
+                                       *val = LONG_MAX;
+
                                if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(threshold, val))
                                        *val = LONG_MAX;

>   ### 3.  cros_ec_hwmon_temp_to_millicelsius 
>   
>   For the standard temperature readings (where  temp  is a  u8 ), an
>   overflow is impossible on all architectures.
>   The maximum value of  u8  is 255. When the offset of 200 is added,
>   the maximum base is 455. Multiplying  455 * 1000  is  455,000 ,
>   which easily fits in a 32-bit (and even 16-bit) integer. The patch
>   author is clearly aware of this, which is why the patch asserts its
>   impossibility via  BUILD_BUG() :                                                                                                   
>   
>         if (check_add_overflow(temp, EC_TEMP_SENSOR_OFFSET, &ret))
>             BUILD_BUG();
>     
>         if (cros_ec_hwmon_kelvin_to_millicelsius_overflow(ret, &ret))
>             BUILD_BUG();

That is correct. The idea is again to share one conversion function
between all users to avoid code duplication.

>   ### Conclusion
>   
>   The patch's claim that calculations "can overflow" is accurate, but
>   the scope of the fix is limited strictly to threshold registers
>   running on 32-bit systems, and it will still emit bogus negative
>   temperatures for unsigned integer values larger than  LONG_MAX
>   (such as  0xFFFFFFFF ).

I'll also mention that the overflow only affects 32-bit systems
and that the compiler will optimize away the checks on 64-bit.

Does that make sense?


Thomas
