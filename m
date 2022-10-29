Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB5B5C433FE
	for <linux-hwmon@archiver.kernel.org>; Sat, 29 Oct 2022 23:44:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiJ2XoL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 29 Oct 2022 19:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiJ2XoL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 29 Oct 2022 19:44:11 -0400
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DD6104454A
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Oct 2022 16:44:08 -0700 (PDT)
IronPort-SDR: OxqeprR4NzHvPlQEgkLRmPr9xPxWmjYYs0iIguOFkTtLknYsvWRom2Piv9EMr/k69JhiGiYhez
 bbpEJF5vgrHEKgbFgOG1pY0/4Gp0NYdhYBb+gYL9+m360SUe/4xi0UWUOat0AWsWHBhO1Qy6Pe
 zrsiIfAIzF87/ABrNPybumkKN/O0Cc6P4isT2q5v4o+BeHfvFoN0jJYGqer0ajW4vQPxUpVqlF
 xvNBz0x8DRkKI6oMkMzyjOl74b3CHnIFNKxD7PDVEf4b95kvNElc+40aAuKrRC8uUdGw7TQH6K
 fLhAJ8EzdrvL3BNzPFmgJfxS
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BUAAAgul1jjPQc8jxaHAEBAQEBAQcBARIBAQQEAQFAC?=
 =?us-ascii?q?YEyBwEBCwGCLIJZjG2IewOdIYF9DwEPAQFEBAEBhQUChHomNAkOAQIEAQEBA?=
 =?us-ascii?q?QMCAwEBAQEBAQMBAQYBAQEBAQEGBBQBAQEBPxgBOQcLUgcLWAcHgUELgWETC?=
 =?us-ascii?q?wMxDYZCAQEBAQIBJxkBATcBDwsOCi5XBgGDD4J+I6wHeIEBM4EBgggBAQaCY?=
 =?us-ascii?q?YMtgV0JgT0BjDIWgzZ6Qz+BToQINz6LAZYvOAMZKx1AAws7MgMKTRtYDgkfH?=
 =?us-ascii?q?A4XDQUGEgMgbgUKNw8oL2cQGxwbB4EMKigVAwQEAwIGEwMgAg0pMRQEKRMNK?=
 =?us-ascii?q?wcjcQkCAyJlBQMDBCgsAwlABxYRJjwHWDoBBAMCECI8BgMJAwIiWHYvERUFA?=
 =?us-ascii?q?w0XJQgFTwQIOgIFBlISAgoRAxIPBiZHDko+ORYGJ0QBNA8OFgNimldsRIEWC?=
 =?us-ascii?q?VmBCQE6klqQAZ5FgTWDcIFMnzSBRII0pRuXKyCCK59BhUACCgcWgWKCFU0fG?=
 =?us-ascii?q?YMiTwECAQEBDQECAQEDAQIBAQEJAQEBAY4dGR6BdYw4YTsCBwsBAQMJij4BA?=
 =?us-ascii?q?Q?=
IronPort-PHdr: A9a23:Z1IwKBUMmMfOfdzKrVd9ksb8HnDV8K3KAWYlg6HPw5pEc7i4uZ/4N
 VPR4u9hylLMQMPa57RNlrmeurrrDGoH55vJq3UeaNpWWhoClchTnhR1DsKJUx+kJffmPSBmQ
 5QQDQ039HviaRpeE56hD2A=
IronPort-Data: A9a23:G/LYnqzgcwF3gF5eH556t+cPwCrEfRIJ4+MujC+fZmUNrF6WrkUAm
 2FLXW+POP6PZjf1fowkYYri8U5XvJLSnN43GlBr/yA9QyMX8pWbWIrCJR2pYSnDdZ3IEBts5
 J0XM9eddstuZ3KN/R3F3prJ9Ckkj/vULlbf5E8oHggrGGeInQ940UoLd9YR29Iu2Z7ja++0k
 YuaT/f3YTdJ5hYtWo4qw/LbwP9QlKyaVAMw5jTSstgW1LN2vyB94KM3fcldHVOhKmVnNrLSq
 9L48V2M1jixEyHBqz+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRYRQR8/ttmHozx+4
 O1npaydcygyB6/3gss5YTdFTQx3M7ITrdcrIVDn2SCS50fHb2CqyO9nE08xJ4Fe9+NqR2BCs
 /UFQNwPRk7bwbjqmvThGq822phLwMrDZevzvllu1zjfDt4tW5ncTaLQ6ZlV2Sp2h8wIFOu2i
 88xNWEyPEmRMkEeUrsRILBmo/qZon3fSRtFiXO3nrtn6GvN1zUkhdABN/KOIofaH58E9qqCn
 UrC/mLkElQaK9mYzxKb/X+2wOzChyX2XMQVDrLQ3vxmjVmNz3YeIAYLTlb9qv684ma6WtRCO
 2QO/Sclru0v7wqtQ8WVYvGjiCDc+0RAAZ8KQ6hgtF3L0bbd/weSQHQcQT8HY9sj8sYrLdA36
 rOXt+vDFQxCipKOcHCm7Jiwnx2vZwUcI3BXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJ9dfYn
 W3iQM8W2et7sCIb60mo1RWc2GLz/8Shohodv1iOBDr9sGuVcab/P+SVBU7nAeFoBbvxorOph
 2kIncWPhAzlJcvVzHTlrAklOry2r82CLSHcyWFmG5Q6nwlBFlb9JcUKvGs7fhcsaJpYPyT1a
 VPSskVN/JBSenCtaOl+fupd6vjGL4C8TbwJtdiONbKih6SdkifdpkmCgmbJjgjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG86kl0r3i+HFOC7OIVvgDLdoRr5nhE9jiFuLm
 +uzy+PQkX2zrcWkPHiIqtRDRbz0BSZgXsymwyCoSgJzClE+QzF7Ua65LUIJZ5Rq16VTiurS+
 HyhMnK0O3Kh7UAr3T6iMyg5AJuxB8kXkJ7OFXB0Vbpe8yR6P9rHAWZ2X8dfQITLA8Q4nKElF
 alcJZTRahmNIxyekwkggVDGhNQKXHyWacimZkJJuRAzIMxtQRLn4Njhcle9/SUCFHPn58Akq
 qKu0RnXB5cGWkJjAIDfdav3nV+2uHEcnsN0XlfJe4cNJBm9rdA2dSGh3OUqJ8wsKAnYwmXI3
 QihASAe+bvHrbgqoYvAiq2zpou0F/dzQxhBFG7B4LfoaSTXpzLxwYJJXOuSUyraUWf4pPera
 elPlqGuO+cOg1hNqYY6HrN2i6MyodLy/ucIwgNhFXTNTlKqFrI5fCfagZgS7vETy+YA6wWsW
 0+J9t1LApmzOZvoQAwLOQ4oTuWfzvVKyDPc2vQCJhmo7iFA4+vVWEpfCBCAlShBIeYnK4gi2
 +og5pIb5gHj2BonNtGK0nJd+2iWdCdSWaQ7rdcRGob0hA0xxhdPZIGaCyOw6YzWM4dANUwjI
 zm1gqvehu0CmBaeIidrSSbAjbhHmJADmBFW11tcdV6HrdrygKNl1hNm7mVlRwtY+RxLzuZvN
 zU5LEZyP6iPoWtliZQRRWyqAA0dVhSV9laqkQlXzCiDExPtDDyIdjFhf/2R9VwY+CRAZjdau
 rqfzSDsTG+yLs322yIzX29jquDiFIIvqlGTxZj7QcnVTYMnZTfFg7O1YTZaoRXQB5JjjULKk
 uBm4eJsZPCpLiUXuaA6VdWX2Ll4pMpo/4CerSyNJJ80IFw=
IronPort-HdrOrdr: A9a23:UGm7vqG3uSXG60pWpLqEOMeALOsnbusQ8zAXPiBKIyC9vPbo9P
 xG+85rsyMc6QxhP03J+7i7VZVoJEmxyXcb2/hyAV7PZmjbUS6TXeRfBOjZskXd8k/FmdK1vJ
 0IG8ND4Z/LfDxHZK3BjjVQfexB/DDKytHQuQ9Qok0dNj2Cc5sQkDuRFDzrbnGemzM2f6bQxf
 Knl7d6mwY=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 30 Oct 2022 10:14:05 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 29TNhx7O2105697
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 30 Oct 2022 10:44:00 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 29TNhx7O2105697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1667087040; bh=9HvhEmkQSYw++Km2WhV6khJI2QnTXYu18+RlbrDYDBk=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=L6iisxb03DPUxvHhrRJIUWpxgh9A2lZ2SYGXdBGgXnNl4vizBY3XCJrLSRKoSLuxu
         bKAGZTsf4xAzANeVJS1ZTyn364AFvBZt1s8IfiJx6+Wm/H1qVYBIvUGdGuSyr3r3Ob
         9VTib9pv8gCLYBJKa3ED4aGC43BbUWJTy64czwahUUJPZ2bBDxg/7uvVzEKHbRrz2p
         501SMEpOOTKprgTsaPHHW70ufvSlLZB2OXef1BUvET+nuqesdlN1T86Dn0DCTxLPUn
         3OkAtY21iegyiEFvt8v3B5bpXTZc82VAfZ/AMi1fgsslPjhxy55J4rInnTPv4Sfm7T
         xR7X6W/7MWckg==
Message-ID: <f802b322431a182c4bdf0f91cd4114fe381ebfe7.camel@crawford.emu.id.au>
Subject: Re: [PATCH v2 1/1] hwmon: (it87) Create DMI matching table for
 various board settings
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
Date:   Sun, 30 Oct 2022 10:43:59 +1100
In-Reply-To: <4a4dd112-2c71-9b8e-8e33-95dac9a8d32f@roeck-us.net>
References: <20221029103057.3234561-1-frank@crawford.emu.id.au>
         <4a4dd112-2c71-9b8e-8e33-95dac9a8d32f@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 30 Oct 2022 10:44:00 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, 2022-10-29 at 07:04 -0700, Guenter Roeck wrote:
> On 10/29/22 03:30, Frank Crawford wrote:
> > Changes in this patch set:
> >=20
> > * Define the DMI matching table for board specific settings during
> > the
> > =A0=A0 chip initialisation and move the only current board specific
> > setting
> > =A0=A0 to this new table.
> >=20
> > * Export the table for use by udev.
> >=20
> > v2: updates following comments:
> >=20
> > * Converted to use callback function.
> >=20
> > * Moved call to callback funtion to sio_data into it87_find in line
> > =A0=A0 with other settings for sio_data.=A0 This requires dmi_data also
> > passed
> > =A0=A0 to access additional data.
> >=20
>=20
> That is really not what I meant when I asked to use a callback
> function.
> As written, the code might as well call that function directly from
> the
> init code, and there would be no reason to have a callback function
> pointer.
>=20
> A callback function would only make sense to me if it is added
> to struct dmi_system_id, and called via dmi_check_system().
> See other callers of dmi_check_system() for examples.

Oh, investigating other kernel code I see what you mean, and it does
simplify one possible future update, but looking through the other
modules in hwmon, I can't see any using a DMI callback.  The primary
use of dmi_check_system() is just as a count of successful matches.

Also, just going back to a previous comment about creating a static
version of sio_data and updating this in the callback, this does worry
me going forward as in future I hope to add code to handle the case of
multiple chips.  Updating the static version for one chip may cause
issues with the other chips.

If I go this way, I'll would probably still use the DMI driver_data,
save it, and apply that where required, rather than doing it directly
in the callback function.  This would be safer as, for example, in the
current patch, setting the sio_data->skip_pwm is safest done after all
the other settings in it87_find(), not prior to all the other setups
done in that function.

>=20
> Thanks,
> Guenter

Regards
Frank

