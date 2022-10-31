Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18014FA3740
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Oct 2022 06:57:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbiJaG5L (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Oct 2022 02:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbiJaG5K (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Oct 2022 02:57:10 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A7419BC30
        for <linux-hwmon@vger.kernel.org>; Sun, 30 Oct 2022 23:57:06 -0700 (PDT)
IronPort-SDR: 1unqv329d4N203eCl9NglVc49rF7+0LTtEydPl6riMtLvCDNqWzDUKcNAmc1ArH0skkaHlMa8h
 1OWwetKv0dRAIXdCsulTp+4w0U5iqrRSc88pq9DrhmsRKc2ZPlOPXd5SqnnGtjTLEXOXq+IbMZ
 aHQ8SeCrVSLgQ0Pud2e9Sqa2nN+T2OUuL+0vDWUdiYXlhIeWFdlanJ23QgzqqqbsM3qgDAZdRG
 E2rxI1i6GFb2KdxMane03hj32tBA6bFDhVXjMvRogNIPs/3fYeenFGajOZkSDj946zvbMj54eS
 ajYkCgsfVoS/G3I8tmM3Pqfp
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2DVCQCicF9jjPQc8jxaHgEBCxIMQAmBOwuCLYJZlWufH?=
 =?us-ascii?q?g8BDwEBRAQBAYUFAoR6JjcGDgECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBB?=
 =?us-ascii?q?gQUAQEBAT8YATkHC1IHC1gHB4FBC4FhEwsDMQ2GQwEBAQNAAQE3AQ8LDgouV?=
 =?us-ascii?q?waDEIMhrFyBNIEBgggBAQaCYYMtgV0JgT0BjDKDTHpDP4FOglGBbj6LAYxAi?=
 =?us-ascii?q?Wo4AxkrHUADCzsyDU4bWA4JHxwOFw0FBhIDIG4FCjcPKC9nEBscGweBDCooF?=
 =?us-ascii?q?QMEBAMCBhMDIgINKTEUBCkTDSsHI3EJAgMhZQUDAwQoLAMJQAcWESQ8B1g6A?=
 =?us-ascii?q?QQDAhAiPAYDCQMCIlZ1LxEVBQMNFyUIBU4ECDoCBQZTEgIKEQMSDwYmRw5KP?=
 =?us-ascii?q?jkWBidEATQPDhYDYJs9gTGDB6Ijn3qDcIFMnzSBRKdPlyunTAIKBxaBeIF/T?=
 =?us-ascii?q?R8ZgyJPAQIBAQENAQIBAQMBAgEBAQkBAQEBjh0ZHoF1jDhhOwIHCwEBAwmKP?=
 =?us-ascii?q?gEB?=
IronPort-PHdr: A9a23:119WChWDeZNAu9dKrilZrNRRyMjV8K3KAWYlg6HPw5pEc7i4uZ/4N
 VPR4u9hylLMQMPa57RNlrmeurrrDGoH55vJq3UeaNpWWhoClchTnhR1DsKJUx+kJffmPSBmQ
 5QQDQ039HviaRpeE56hD2A=
IronPort-Data: A9a23:HynnOKriw52Pahd2+9SP11BC93leBmIgYxIvgKrLsJaIsI4StFCzt
 garIBmBb/zeZmT8edhzbNi28B9UsJGBytIyTQZr/yFhRXgVo8HMCdqUIByoYHjMdcCcF0g9v
 5xFZ9eYcJ05EHaNqkr8G7Ww9nMUOYOgH+qkUrSYUsxSqa6IbA971HqPTsZg2tYAbeCRWl/L4
 ZWoyyHmEAfNNwRcawr41orawP9RlKSq0N8nlgRWicBj5DcyQFFIZH63DfjZw0rQGuG4LMbjL
 wrw5O3RElfiwvsYIojNfoAX06E9auW60QCm0hK6UkU56/RIjnRaPq0TbJLwZarL4tmEt4gZ9
 TlDiXC/YSwZHurDxdYPaB8bNChgF6dJ/LOWMUHq5KR/z2WeG5ft6/9vEFpwNpcR5ehwG20I+
 PkFbjEBKBme7w606OzjDLMw3IJ5fI+xYN93VnJIlFk1Cd4oW5nFQI3B/9ZH0jAqioZDGOuYZ
 sZfYCcHgBHoP0YSawtHV81m9AuurmXbYhEGpX+bnvoY8Xfh6BNq8JbNasWAL7RmQu0Oxh3I/
 DiXl4jjOTkeNdqC2X+F7XergMfRki7hHoEfDru18rhtmlL77m4fBRkIXEG2ieKkkUP4UNVaQ
 2QQ+ywzvYAo80GgTZzgRFu+rWLsg/IHc4QIVrdmskTXmu+Ov1rfHXQNUj9KLsA+u85wTjsvk
 FaU9z/0OdBxmJalaTWSq4WGljXxHiELB2UNYSNVXTJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2QM4W2et7YSkjifvTwLzXv96/jt2SFV5qv1m/snaNt14gPtb9OeRE/HCBtZ59wJClok6pl
 UVsdyK21/ECC5yc/MBmaL9VROnBCxqtFjDDyWVoAoUhvwuk/3O4Fb28DRkgfAIzbpxBI2+sO
 hOP/xhN7YNSNz22daB2JYm2DoIj0MAM9OgJtNiIN7KigbArL2drGR2Cg2bKgggBd2B1wMkC1
 W+zK5rEMJrjIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+TBPSPJF+1YYALSBgzc0E9iiFuLm
 zq4H5XUoyizrMWkOEE7DKZJcwFVdiJrbXwIg5IOJ77eSuaZJI3RI6SJmuN7Id0Nc1V9iv/Ht
 nC7RkJCzlfj7UAr2i3UAk2PnIjHBM4lxVplZ3NEALpd8yR7CWpZxPtGKcdfkHhO3LAL8MOYu
 NFfK5jQUq4fEW2ak9nfBLGkxLFfmN2QrVrmF0KYjPIXJvaMniTFpY3peBXB7i4LAnblvMcyu
 eTwhAjBSIUNQB5uSsvTdbSuwxW4oCFFyu51WkLJJPhVeVntqdY0d3Kp0aNteMxcew/ewja61
 hqNBUlKr+f6o7gzrIvDi5eb/tWgHOZJF0ZHG3XWsOStPi7A82v9nYJNCb7afT3UWG7u1r+lY
 OFZk6P1PPEdxQYYuJB1DLhs16546t7y4b5WiA15RS2ZY1OuA7JmA3+HwcgW6PMRmOcG5VHtV
 xvWqNdAOLiPNMf0K3IrJVIoPraZyPUZujjO9vBrck/00y9A+ubVW0tlIEjegSNQG7J5LYc5z
 Lpzo8UR8QG+1EYnP9va3CBZ82OAci4JX6k97MpICo73kUwg0Fhdb5vGBmn75YzJatkKO1Rze
 m2Yg6/LhrJ9wEveciNtSySThbUB388D6EJQ0VsPB1WVgd6b1PU56x1m92hlRApi0UQV2u1+D
 WFnKklpKPjc5DxvnsVCATyhFl0THhGf4UCtmVIFmHeCFRv2DimXcDd4Y7bIphxFtXlAdyRa9
 /eE0GnkFz3teYf4w3JqC0JirvXiS/139xHDwZ75Q5rdQMVgOje10LWzYWcoqgf8BZ9jjkPwo
 7g49el9XqT3KCoMrvBpEIKdz7kRFkyJKWEqrSuNJ0/V8bwwoA2P5AU=
IronPort-HdrOrdr: A9a23:vjYnA6/gIfiOqbsAG1tuk+AOI+orL9Y04lQ7vn2ZKSY+TiVXrb
 HMoB19726TtN9xYgBGpTjjUJPsfZq4z/JICOYqTNWftWXd2VdAabsSiLcKoAeQYxEWlNQz6U
 4IScEXY+EYT2IK6foSizPXLz9P+rm6GeyT9J7jJ/gBd3AQV0h51XYGNu+AKDwIeOBZP+tEKH
 NC3Ls8m9JwEU5nE/iGOg==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 31 Oct 2022 17:27:03 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 29V6uoVQ396442
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Mon, 31 Oct 2022 17:56:51 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 29V6uoVQ396442
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1667199413; bh=qoc6wCyZ7jAYJHXef7f/3WI4rlGPFILjWwpalK0f2+Q=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=opui097zvirL7bFf2lzGU+rni5WhU5W2YgCJD3ZfLZRVaSZw5XmHyDS2/0Kp44LP3
         O0gPo03aq1qaD2NpKesJhUZeyfWJ8FxL7CylbIZiE4GXnXOS/d4B0a2xpbsHo9P7jl
         CYZze7EyVZwbXx/1qFJaoNRc7GHsrCCMLgVuyXJh9QHEty7xuutm3WKrcvJETC8SpH
         LQ4manxq0MxVw6sso8h+Gb2m+LpNKz/VpLsVwj7LApiRglvbxvSdywI1XecB3qid7K
         qWYnq3qLn26oV1xBPUqSM0j6XEc3Lh4dm6vAIAgqGhHgCjFGncbwisekoZzkIgkkRw
         oJF1rJF/vdggA==
Message-ID: <bb7fe27144e359707e791a349da6e363db961cef.camel@crawford.emu.id.au>
Subject: Re: [PATCH v2 1/1] hwmon: (it87) Create DMI matching table for
 various board settings
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date:   Mon, 31 Oct 2022 17:56:50 +1100
In-Reply-To: <20221031031810.GA1396334@roeck-us.net>
References: <20221029103057.3234561-1-frank@crawford.emu.id.au>
         <4a4dd112-2c71-9b8e-8e33-95dac9a8d32f@roeck-us.net>
         <f802b322431a182c4bdf0f91cd4114fe381ebfe7.camel@crawford.emu.id.au>
         <20221030013909.GA1264837@roeck-us.net>
         <cd0def02f2397db0a05f100debe9d11b0f6d5ac0.camel@crawford.emu.id.au>
         <20221031031810.GA1396334@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Mon, 31 Oct 2022 17:56:53 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



On Sun, 2022-10-30 at 20:18 -0700, Guenter Roeck wrote:
> On Sun, Oct 30, 2022 at 01:06:45PM +1100, Frank Crawford wrote:
>=20
>=20
...
>=20
> I can see that you are for whatever reason completely opposed to
> using=20
> the dmi callback function. Fine, but then don't introduce another one
> just to have a callback function and in case it may possibly be
> needed
> sometime in the future. Introduce it if and when it is needed, and
> only
> then. The same applies to all other infrastructure: Introduce it if
> and
> only if it is needed for more than one use case, not because it may
> be
> needed for some unspecified use case some time in the future.

No, you get me wrong, I'm not completely opposed, although partly it
was a misunderstanding on my part, as there are no good examples of the
use of callbacks for DMI tables in the codes I looked though.  I had to
go looking into the actual functions to see how they are supposed to be
used.

Also, the most of the items I raise are not future cases for me, as
they are in the out-of-tree version, and I am working on keeping that
roughly in sync with the in-tree version, while I work on trying to
merge most of that functionality in.

Anyway, you should see that I've now submitted a v3 patch, which I
believe does use the callback correctly, and is generally suitable for
handling future updates as well.
>=20
> Thanks,
> Guenter

Regards
Frank
