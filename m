Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B6A2C433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 10 Feb 2022 08:56:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238072AbiBJI4x (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 10 Feb 2022 03:56:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238097AbiBJI4w (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Feb 2022 03:56:52 -0500
X-Greylist: delayed 359 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 10 Feb 2022 00:56:54 PST
Received: from mail.trixen.pl (mail.trixen.pl [192.71.213.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ABD410A0
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Feb 2022 00:56:53 -0800 (PST)
Received: by mail.trixen.pl (Postfix, from userid 1001)
        id 97A3A40C1A; Thu, 10 Feb 2022 09:50:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trixen.pl; s=mail;
        t=1644483053; bh=J50dbWEn9x62xyxY1PWPtYxMwNMcDFoILqXfzM3his0=;
        h=Date:From:To:Subject:From;
        b=lWAc1P0q7atzzx0rpVdda0GCW/pksXBXZ1PXIF8GdLGuAe66wzSldG7q+b8mo0vxC
         sYhlekOU3vJSkZMq93n6PWD+yaeQLURW2GJIcWRw5+k1SO/Qy2bn+PJwwLb7h32Y7M
         lSE/K5JyVe0W4akchU3CflCW3PWVmKmPQKubMp3aO4FGbp6mwrGDOAk5vEG4eY8wy0
         8l/7nB6jcALBn6hEBl00t5MGFmATPSc7t/I33YXyy3V9fqpL+uLhfR8HnXr0DRWQpq
         BM0OetbpLMlQPmy+Hwi5bIDsYNpvxF5cFXjBlRUYlXNXUey0miXagBcPJa2KkO5/hW
         UV9+UAYC527Qw==
Received: by mail.trixen.pl for <linux-hwmon@vger.kernel.org>; Thu, 10 Feb 2022 08:50:34 GMT
Message-ID: <20220210084500-0.1.t.1u9m.0.65iw3z2p5b@trixen.pl>
Date:   Thu, 10 Feb 2022 08:50:34 GMT
From:   =?UTF-8?Q? "Rados=C5=82aw_Grabowski" ?= 
        <radoslaw.grabowski@trixen.pl>
To:     <linux-hwmon@vger.kernel.org>
Subject: Monitorowanie samochodu
X-Mailer: mail.trixen.pl
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Dzie=C5=84 dobry,

Chcia=C5=82bym przedstawi=C4=87 rozwi=C4=85zanie, kt=C3=B3re poprzez wyko=
rzystanie GPS monitoruje samochody w czasie rzeczywistym.=20

Dzi=C4=99ki temu mog=C4=85 Pa=C5=84stwo odczytywa=C4=87 wszelkie warto=C5=
=9Bci dotycz=C4=85ce np. zu=C5=BCycia paliwa czy obrot=C3=B3w silnika.

System automatycznie generuje rozbudowane raporty i pozwala dokonywa=C4=87=
 istotnych analiz.

Je=C5=BCeli interesuje Pa=C5=84stwa zwi=C4=99kszenie wydajno=C5=9Bci prac=
y i kontrola wszelkich parametr=C3=B3w floty - prosz=C4=99 o kontakt.


Pozdrawiam,
Rados=C5=82aw Grabowski
