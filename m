Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70350C433FE
	for <linux-hwmon@archiver.kernel.org>; Sun, 30 Oct 2022 02:06:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiJ3CG5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 22:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ3CG5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 22:06:57 -0400
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B2E013FED1
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 19:06:53 -0700 (PDT)
IronPort-SDR: /22zNAf/6ExbT6iyv+eRLnK+dCG1Y9dw75d2aqBfvn1BKW/9+HBta67rBwe5EzoVTdBOSTlauJ
 OSHtjEwq1WYUtBIHSL1U6dFBkah8NUtZpMTguS/sOalNhdb1xw/y7WMo52h3isvYLf/aUcAdv9
 BqCFhiCmjKCG7ASSj1b/aoJWOcqGidAXigHBKHaz/pW5RbYBqY2RC5jdNbeQ6X+q5xnVieny5Q
 cxGKiqQRoxwkUHKHPSuHvchnk8YpIKhBW6rtrHx7g2FzBM6wFihGigdtrsstoJ3h7CkzViLToC
 AiOQ4YKDwT43SzdXad3bjnQy
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2AIBwBx211jjPQc8jxaHgEBCxIMQAmBOwuCLYJZlWgDg?=
 =?us-ascii?q?ROcDoF9DwEPAQFEBAEBhQUChHomNAkOAQIEAQEBAQMCAwEBAQEBAQMBAQYBA?=
 =?us-ascii?q?QEBAQEGBBQBAQEBPxgBOQcLUgcLWAcHgUELgWETCwMxDYZCAQEBAQIBQAEBM?=
 =?us-ascii?q?gUBDwsOCi5XBoMQgn4jq3h4gTSBAYIIAQEGgmGDLYFdCYE9j396Qz+BToEVg?=
 =?us-ascii?q?TyBNzc+iwGMQ4lsOAMZKx1AAws7Mg1NG1gOCR8cDhcNBQYSAyBuBQo3DygvZ?=
 =?us-ascii?q?xAbHBsHgQwqKBUDBAQDAgYTAyACDSkxFAQpEw0rByNxCQIDImUFAwMEKCwDC?=
 =?us-ascii?q?UAHFhEmPAdYOgEEAwIQIjwGAwkDAiJYdi8RFQUDDRclCAVPBAg6AgUGUhICC?=
 =?us-ascii?q?hEDEg8GJkcOSj45FgYnRAE0Dw4WA2KbQ0SBARUJWYFEklqQAZ96g3CBTJ80g?=
 =?us-ascii?q?USCNKUblyuCS59whRECCgcWgWKCFU0fGYMiTwECAQEBDQECAQEDAQIBAQEJA?=
 =?us-ascii?q?QEBAY4dGR6BdYw4YTsCBwsBAQMJij4BAQ?=
IronPort-PHdr: A9a23:qWSrXBR6h+Gm23Hdq64Cmt5Jjtpso4vLVj580XJvo7hPbr/l9I7rI
 0LY//krgVrUG4TXrftZ2KLfqau1X2sG7N6atWwaNoZBUhgZhIAXh1kuDMLfWxLyJfK4Y3BlT
 JYbBg1u9SjjY0NeQJmWWg==
IronPort-Data: A9a23:sVHnnKkc1GfA2cms/xTU5sLo5gy5IERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYDGrSPvmDYGPwf4x2bdjk/E1SvZKEy9JkGgo4/3syRSISopuaX9/EJ0qvbijNI8SdHB824
 58SMoGfdsk4Qi6Mjxr8abKJQVtUjPHQHOCgYALn1oGdYSc+FU/NXDo6w7ZRbrZA2IT/W0XX0
 T/Li5W31GWNglaYD0pNg069gEM31BjNkGtwUmwWPZina3eD/5W9JMt3yZCZdxMUcKENdgKJb
 7qrIIWCw4/s10xF5uVJM1rMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKtao23hojx/9
 DlCnaGBUgwVLOrios4MaCBpIj1bIJxc/aCSdBBTseTLp6HHW3Ht3+4oB1s/IoMf4OoxDGRTs
 /0UbjkQBvyBr7zuhujnEK821oJ5cJWD0IA34xmMyRnXF/8gQrjIWazV69hC0HE9g90IHPqYb
 tdxhT9HNkWaPUMUYgtGYH44tNbzv2DPLjl6kXOYm7cdxkPo7xRg/be4ZbI5ffTRHZ4FxBzJz
 o7cxEz9AxcHJJmf1j+C9FqyieLV2yD2QoQfEPu/7PECqF+fy2gNAQcbfUCmuvT/gUm7M/pbK
 koJ6gI0qqU59wm2VZ/7UgHQnZKflkBEHoAMSahguETXlvaS+BqQGmkPCCJZZ91gv8gzAzU3v
 rOUoz/3LQFeq7apWzWzzJ2FlgqDCDQwMF4YYDBRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnML
 9ai8nVWa1I705Bj6kmrwbzUq3f3/ciWF1JdChH/Bz/8tFshOuZJcqTysTDmAeB8wJGxZ2TpU
 JIsoNmS6u0fZX1mvHbVGL1l8F2BwfuaeAbbnEJvV6Yo8zm2k0NPkKgOuHQkeB0saJZBI2O1J
 lTPsB9Q79lPJHSrK6RwZsS4FqzGLJQM9/y5Dpg4jfIUOfCdkTNrGgk0PyZ8OEi0wSARfVkXY
 8vzTCpVJS9y5V5b5DS3XfwB9rQg2zozw2jeLbiikUr4ieTOPiXOFedeWLdrUgzfxP3ayOky2
 4gBX/ZmNz0FCoUSnwGNr99MdgpaRZTFLc6t8JAHHgJ8HuaWMDp5UK+Lm+JJl31Ng7xa3ubO4
 nynXEJEoGcTdlWZQThmnktLMeu1Nb4h9y1TAMDZFQrws5TVSdr2svt3mlpeVeVPydGPOtYvH
 qZUIZXZXKUeItkFkhxEBaTAQEVZXEzDrWqz0+CNOVDTprZsGF7E/MHKZAzq+HVcBya7r5Ju8
 ba63xzVRoAPAQlnEYDXZLSm0grp73QanetzWWrOI8VSIRuyrNUycHKo1vJncdsRLRjjxyeB0
 1jECxkvpd7L/90//u7W1PKNoIqeGudjGlZXQjvA5rGsOCiEomeumNcSUOuBcT3Hennz/aGuO
 bdcw/3maa1Vl0xDrIR7CbotwKcjodrj4bZHl1w2EHLOZlWtK7VhPnjfg5cT6/UWmOYBtFLvC
 EyV+9RcNbGYA+/fEQYcdFg/c+CO9fAIgT2Mv/47F0XN4nMl9rSwThQANhaBvyVRMb9pPd532
 uwmosMXtVCyhxd2YNaLiidYqzaFInAaCf51vJAGG8ngkAM0xFZYbdrRDzKw4Z3JYsgVahsmJ
 TqdhazjgbVAxxOcLSZuTSOThLJQ1cYUpRRH7F4ePFDXyNDLsf8A2kED+zoAUVUHxxpK5Ot/J
 2x3OhAnPq6J5Tpp2pROUjz+AQ1HHxHFqEX9x0FSzj+HFwzyCjaIdj14Y7rRulsF+n5ddX5H5
 L6Zjm3iVHDjYZipjCc1XEdkrd3lTMBwr1OcxJ3/RJrcR5RqMyD4hqKOZHYTr0e1C80GghyVr
 OZny+98dKnnOHNCuKY8EYSbi+gdRR3syLaumh29EH7lxV3hRQw=
IronPort-HdrOrdr: A9a23:ufoYVayfbO8FvUl7WeXmKrPw/L1zdoMgy1knxilNoHxuGPBwWf
 re/8jzsiWE7gr5OUtQ/uxpWsG7LE80kKQY3WB/B8bBYOCLggqVxcRZnO7fKl7balXDH4xmup
 uIGpIWYLbN5BpB/KLHCWKDferIruPmzEnlv5am85/jIDsaEJ2I9z0JdTpzDHcGODWu2qBJbq
 Z1N6J81kedRUg=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 30 Oct 2022 12:36:51 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 29U26jJY2155923
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 30 Oct 2022 13:06:45 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 29U26jJY2155923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1667095606; bh=6NOvCKiigxa5p2/ym2Sut70nGoGjhKA4GJ0O8kDDf7M=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=NEXT+kqQlJ3UeDlKW2rZi8mLklUwEwgpyaqpI7Gs5juhBisxI5q6oEIv2AF7P8vsU
         hdN5fRcaajB5oT18jqvhqX3e0vdQOFeKTIn4oBIMI268ltlN03PoRddFXbXNeDMZ0Y
         M52JI393hMIpUxH+KZRKz7AS/p/2Zfe1iB1ytHVFsqEIAS8lXsIRElQBBDe2BDqGhU
         fGm87DDFHuH+HZ5qagby6i79GZxf2m5kgKxzx4IsmtDUfJIISnKManyPEdQm5zJx+4
         xuYWlRvkL/ltdHHEHjmmZ/wpW2BccR8g6oOHPcoVHusJc9fSfk/7/ntwoyKw2gNtvs
         Cm7cdMtKW5zng==
Message-ID: <cd0def02f2397db0a05f100debe9d11b0f6d5ac0.camel@crawford.emu.id.au>
Subject: Re: [PATCH v2 1/1] hwmon: (it87) Create DMI matching table for
 various board settings
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date:   Sun, 30 Oct 2022 13:06:45 +1100
In-Reply-To: <20221030013909.GA1264837@roeck-us.net>
References: <20221029103057.3234561-1-frank@crawford.emu.id.au>
         <4a4dd112-2c71-9b8e-8e33-95dac9a8d32f@roeck-us.net>
         <f802b322431a182c4bdf0f91cd4114fe381ebfe7.camel@crawford.emu.id.au>
         <20221030013909.GA1264837@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 30 Oct 2022 13:06:46 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, 2022-10-29 at 18:39 -0700, Guenter Roeck wrote:
> On Sun, Oct 30, 2022 at 10:43:59AM +1100, Frank Crawford wrote:
> > On Sat, 2022-10-29 at 07:04 -0700, Guenter Roeck wrote:
> > >=20
...
> > > That is really not what I meant when I asked to use a callback
> > > function.
> > > As written, the code might as well call that function directly
> > > from
> > > the
> > > init code, and there would be no reason to have a callback
> > > function
> > > pointer.
> > >=20
> > > A callback function would only make sense to me if it is added
> > > to struct dmi_system_id, and called via dmi_check_system().
> > > See other callers of dmi_check_system() for examples.
> >=20
> > Oh, investigating other kernel code I see what you mean, and it
> > does
> > simplify one possible future update, but looking through the other
> > modules in hwmon, I can't see any using a DMI callback.=A0 The
> > primary
> > use of dmi_check_system() is just as a count of successful matches.
> >=20
> > Also, just going back to a previous comment about creating a static
> > version of sio_data and updating this in the callback, this does
> > worry
> > me going forward as in future I hope to add code to handle the case
> > of
> > multiple chips.=A0 Updating the static version for one chip may cause
> > issues with the other chips.
> >=20
> The value is set based on DMI data. I don't see how that would make
> a difference even if there are multiple chips. The DMI data would
> still be the same and is board specific, not chip specific.

For present cases, yes, but consider the current setting, which
disables pmw2 for the FN68PT board, if there was a second chip on that
board, you would not want the same setting for both chips.

I haven't yet worked out how it would be distinguish at the time, but
also it hasn't been strictly necessary.

A simple case I have coming up for future patch is to use the DMI table
to ignore ACPI conflicts when we know it is safe, but that should be
done on each chip separately, not necessarily globally for all chips on
that board.  Again, in practice it isn't important, and I haven't
worked out how to specify it separately yet.

Also, I have been looking at the difference in the use of
dmi_check_system() and what the use of dmi_first_match() does and it
really is just a case of the callback being used at the time of
matching vs deferring the actions to be performed at later and possibly
more appropriate stages.

>=20
> Guenter

Regards
Frank
