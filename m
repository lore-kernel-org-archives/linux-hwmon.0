Received: from mail.as397444.net (mail.as397444.net [69.59.18.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055C01DD866
	for <linux-hwmon@vger.kernel.org>; Sat, 19 Apr 2025 19:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.59.18.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745091005; cv=none; b=KPc2zdpok0KT6WJuEAG3WpAcmoAnbA+gfGIz+WziKC6+4xZHx2KnMi6Yjyg1PdyKOs4EpA6IBwURHGww2OmSZwXFCuyWDSbEQ1UTPUqv84MENeiOA01RC1TtzWeEOQjapTiFKqGbnFfmaTn2jiCt1UmxTImHGd6CCCbfyNXvxvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745091005; c=relaxed/simple;
	bh=lWkUbCZ9Q0A4BnQjsAqRqLctfZ+BFuau96WIf5qpWSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rv3mlOJ1pJ2rsaMx3W9X7Ndo4jloAlG+Q1sIhRDSzykm7jxXTCIMM0UIb2Fq2xYKcAs2fL0OWTXgENEzyoNumyJMaEXa2sHquYSJJ5ZvYUgo0/8XwXm0PCIg80fG6UO5Y3/q7iwxGpsFTU106iji08I1W01taU6H1kSWUj4oyNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com; spf=pass smtp.mailfrom=mattcorallo.com; dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b=B5H9zNt0; dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b=TyOVG8oI; arc=none smtp.client-ip=69.59.18.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mattcorallo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mattcorallo.com header.i=@mattcorallo.com header.b="B5H9zNt0";
	dkim=pass (2048-bit key) header.d=clients.mail.as397444.net header.i=@clients.mail.as397444.net header.b="TyOVG8oI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mattcorallo.com; s=1745089263; h=In-Reply-To:From:References:Cc:To:Subject:
	From:Subject:To:Cc:Reply-To; bh=npwtTpA0NzF8nc/tw9pHwJzqkQMnQ2w4PFAc3O+Ak4o=;
	b=B5H9zNt0SxCfaYwmaCrE7tJwknYNgTtMWH9t7gDS76JPYbvnSAafnYawB9qqKLxJegxHa3sS+IY
	VXg3tXOf4UNS3r+tumiI8KKzTiqDbrBEfyd/yEty7wwAxb+eDK61XnN4IXzV9fH+3xhGDGkWaZHvV
	YZ74HxiT9yI6HxJlY2xrTmzDKMGCIT8MVuOnKl3YZhDIdyO6vLOXb4/CzNYiipb+meJ+eiXKVEmao
	nhXBkhEJYs4PPnIcxfyyi9Qv6ItG/AJmIzEeKgsLataK5YRoqhS5IA/mhCYQbdKz8Mn2+W55hheFZ
	xU+9EWGf5zH4HlRdxMki+UxaqJsz72f57W1Q==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=clients.mail.as397444.net; s=1745089265; h=In-Reply-To:From:References:Cc:
	To:Subject:From:Subject:To:Cc:Reply-To;
	bh=npwtTpA0NzF8nc/tw9pHwJzqkQMnQ2w4PFAc3O+Ak4o=; b=TyOVG8oI4Q4vg1xR+1UCI3H2mr
	6Z1bN5Ig5NIVHLBWolCZBOmXaZa6VFQiSUEElFcuIwsLE/hdpu/OQkwhr/2wwsvfHD5/2VgRcu6jX
	1NQiRSEh7GtFs9x/Wly7TwcgmJFMTQufrXHwwT40O9CurEUAMsLAvWyceZvEbJ2zkBgAseo6+fVYA
	M48IlxI+aL4HoM5FXgJ6gzujuqKG192S+rzPpEobd28nxItW5Y4xQ0sMzdL4RnoCn5/9Szp+8DXm4
	FbT0bZ9ghtW7rIxML3iehdiqfYxT1Dvwj5thDYJ+reTynHchyhQnz0PQK6emDVar9bhLTYh7rTTRw
	P5leJKgQ==;
X-DKIM-Note: Keys used to sign are likely public at
X-DKIM-Note: https://as397444.net/dkim/mattcorallo.com and
X-DKIM-Note: https://as397444.net/dkim/clients.mail.as397444.net
X-DKIM-Note: For more info, see https://as397444.net/dkim/
Received: by mail.as397444.net with esmtpsa (TLS1.3) (Exim)
	(envelope-from <yalbrymrb@mattcorallo.com>)
	id 1u6Dt2-009hI1-20;
	Sat, 19 Apr 2025 19:30:00 +0000
Message-ID: <fcfd78d2-238d-4b68-b6ec-5ee809c4ef08@mattcorallo.com>
Date: Sat, 19 Apr 2025 15:29:59 -0400
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: PMBus memory overflow
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
References: <985cd95f-155b-4b8a-9fe7-59938d0c2b8f@mattcorallo.com>
 <9e01e3ec-3ac5-4d83-a065-d00d568b9cc7@roeck-us.net>
 <e030f44f-11ee-4739-b9d3-c22883bbbf02@mattcorallo.com>
 <336f298f-497f-4dd9-97ee-50b81221be06@roeck-us.net>
 <1b1eccff-a306-4e17-a6bf-fd3203c61605@mattcorallo.com>
 <1edc8396-535d-4cdf-bbb7-11d559d4c257@roeck-us.net>
 <cfc2b3c8-3f94-407a-a4d5-e7d81686eb2d@mattcorallo.com>
 <84258b48-03b5-4129-bed5-f8200996f2eb@roeck-us.net>
Content-Language: en-US
From: Matt Corallo <yalbrymrb@mattcorallo.com>
In-Reply-To: <84258b48-03b5-4129-bed5-f8200996f2eb@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 4/19/25 3:05 PM, Guenter Roeck wrote:
> On 4/19/25 10:53, Matt Corallo wrote:
>>
>> Sure, of course. Obviously easier to do in pmbus_peek if you have any suggested logs you want. The 
>> device caps output is (and still never hit my BAD LEN printf):
>>
>> ./a.out -b /dev/i2c-3 -l -v 0x58
>> PMBus slave on /dev/i2c-3, address 0x58
>>
>> Inventory Data:
>>    Manufacturer:        FSP-GROUP
>>    Model:        FSP520-20RAB
>>    Revision:        (null)
>>    Built on:
>>    Serial:
>>    IC Device:        PIC24FJ32GA004
>>
>> PMBus revisions (0x22):    part I, ver 1.1; part II, ver 1.2
>> Capabilities (0x90):    PEC, SMBALERT#, 100 KHz
>>
>> Supported Commands:
>>    00 page                      rw u8 (bitmask)
>>    01 operation                 rw u8 (bitmask)
>>    02 on_off_config             rw u8 (bitmask)
>>    03 clear_fault                w nodata
>>    05 page_plus_read             w block
>>    19 capability                r  u8 (bitmask)
>>    1a query                     rw process_call
> 
> pmbus_peek uses the query command to determine if a command
> is supported or not. It doesn't try to read other commands.
> 
>>    1b smbalert_mask             rw block
>>    20 vout_mode                 r  u8 (bitmask)
>>    30 coefficients              r  process_call
>>    3b fan_command_1             rw s16 (LINEAR)
>>    79 status_word               r  u16 (bitmask)
>>    7a status_vout               r  u8 (bitmask)
>>    7b status_iout               r  u8 (bitmask)
>>    7c status_input              r  u8 (bitmask)
>>    7d status_temperature        r  u8 (bitmask)
>>    81 status_fans_1_2           rw u8 (bitmask)
>>    86 read_ein                  r  block(6), Energy counter (DIRECT)
>>    87 read_eout                 r  block(6), Energy counter (DIRECT)
>>    88 read_vin                  r  s16 (LINEAR), Volts
>>    89 read_iin                  r  s16 (LINEAR), Amperes
>>    8b read_vout                 r  x16 (VOUT_MODE), Volts
>>    8c read_iout                 r  s16 (LINEAR), Amperes
>>    8d read_temperature_1        r  s16 (LINEAR), degrees Celsius
>>    8e read_temperature_2        r  s16 (LINEAR), degrees Celsius
>>    90 read_fan_speed_1          r  s16 (LINEAR)
>>    95 read_frequency            r  s16 (LINEAR)
>>    96 read_pout                 r  s16 (LINEAR), Watts
>>    97 read_pin                  r  s16 (LINEAR), Watts
>>    98 pmbus_revision            r  u8 (bitmask)
>>    99 mfr_id                    r  block, ISO 8859/1 string
>>    9a mfr_model                 r  block, ISO 8859/1 string
>>    9d mfr_date                  r  block, ISO 8859/1 string
>>    9e mfr_serial                r  block, ISO 8859/1 string
> 
> That also means it does not try to read mfr_revision or mfr_location
> since that is not supported. The PMBus driver in the kernel does
> try to read those (it doesn't use the query command to determine
> if a command is supported or not).
> 
> My suspicion is that the power supply returns something (but not
> valid SMBus block data) when reading those commands. If modifying
> the kernel to find out is not easy, another option might be to
> enable smbus tracing. Would it be possible to do that ?
> Another option might be to modify the pmbus_peek command to read
> those registers, or maybe even better to use i2cget to read the
> data directly.

Hmm, doesn't seem to trigger it at least with pmbus_peek.c, the following diff still doesn't hit the 
too big prints:

diff -U5 orig.c pmbus_peek.c
--- orig.c	2025-04-19 19:28:44.314887951 +0000
+++ pmbus_peek.c	2025-04-19 19:26:42.721194496 +0000
@@ -619,16 +619,19 @@
  	}

  	if (data.block[0] <= read_len) {
  		if (data.block[0] > 32) {
  			/* NOTE:  this probably won't be visible */
+fprintf(stderr, "\nERR too big 32!\n");
  			retval = -EFBIG;
  			goto try_i2c;
  		}
  		retval = read_len = data.block[0];
-	} else
+	} else {
+fprintf(stderr, "\nERR too big!\n");
  		retval = -E2BIG;
+}
  	memcpy(read_buf, &data.block[1], read_len);

  	return retval;

  try_i2c:
@@ -1016,11 +1019,11 @@
  	 *
  	 * NOTE:  this assumes we can check prefixes for PMB_MFR_EXT(x)
  	 * and PMB_EXT(x) operations, even though we can't query those
  	 * operations directly...
  	 */
-	if (is_pmb_extended(cmd))
+	//if (is_pmb_extended(cmd))
  		return -1;

  	if (pmdev->op[PMB_QUERY] == &unsupported || pmdev->no_query)
  		return -1;

@@ -1044,12 +1047,12 @@
  	int status;

  	/* For non-queryable devices we'll still try to read inventory
  	 * data strings.  That should be harmless but informative.
  	 */
-	if (checksupport(pmdev, cmd) == 0)
-		return NULL;
+	//if (checksupport(pmdev, cmd) == 0)
+	//	return NULL;

  	memset(buf, 0, sizeof buf);
  	status = pmbus_read_block(pmdev, cmd, sizeof buf - 1, buf);
  	return (status > 0) ? strdup((void *)buf) : NULL;
  }

> Somewhat unrelated to this, it might be time to revisit using the
> QUERY command to determine what is supported. If only I had an endless
> amount of time ... oh well. When I wrote the kernel driver, none of
> the chips I had available at the time supported that command :-(.
> 
> Thanks,
> Guenter
> 
> 

