import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes.dart';

class TermsView extends StatelessWidget {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          child: GestureDetector(
            onTap: () {
              context.go(Routes.signUp);
            },
            child: SvgPicture.asset("assets/icons/back-arrow.svg"),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
          child: Text(
              "Ownership of Site; Agreement to Terms of Use\n\n"
                  "These Terms and Conditions of Use (the \"Terms of Use\") apply to the Apple web site located at www.apple.com, and all associated sites linked to www.apple.com by Apple, its subsidiaries and affiliates, including Apple sites around the world (collectively, the \"Site\"). The Site is the property of Apple Inc. (\"Apple\") and its licensors. BY USING THE SITE, YOU AGREE TO THESE TERMS OF USE; IF YOU DO NOT AGREE, DO NOT USE THE SITE.\n\n"
                  "Apple reserves the right, at its sole discretion, to change, modify, add or remove portions of these Terms of Use, at any time. It is your responsibility to check these Terms of Use periodically for changes. Your continued use of the Site following the posting of changes will mean that you accept and agree to the changes. As long as you comply with these Terms of Use, Apple grants you a personal, non-exclusive, non-transferable, limited privilege to enter and use the Site.\n\n"
                  "Content\n"
                  "All text, graphics, user interfaces, visual interfaces, photographs, trademarks, logos, sounds, music, artwork and computer code (collectively, \"Content\"), including but not limited to the design, structure, selection, coordination, expression, \"look and feel\" and arrangement of such Content, contained on the Site is owned, controlled or licensed by or to Apple, and is protected by trade dress, copyright, patent and trademark laws, and various other intellectual property rights and unfair competition laws.\n\n"
                  "Except as expressly provided in these Terms of Use, no part of the Site and no Content may be copied, reproduced, republished, uploaded, posted, publicly displayed, encoded, translated, transmitted or distributed in any way (including \"mirroring\") to any other computer, server, Web site or other medium for publication or distribution or for any commercial enterprise, without Apple’s express prior written consent.\n\n"
                  "You may use information on Apple products and services (such as data sheets, knowledge base articles, and similar materials) purposely made available by Apple for downloading from the Site, provided that you (1) not remove any proprietary notice language in all copies of such documents, (2) use such information only for your personal, non-commercial informational purpose and do not copy or post such information on any networked computer or broadcast it in any media, (3) make no modifications to any such information, and (4) not make any additional representations or warranties relating to such documents.\n\n"
                  "Your Use of the Site\n"
                  "You may not use any \"deep-link\", \"page-scrape\", \"robot\", \"spider\" or other automatic device, program, algorithm or methodology, or any similar or equivalent manual process, to access, acquire, copy or monitor any portion of the Site or any Content, or in any way reproduce or circumvent the navigational structure or presentation of the Site or any Content, to obtain or attempt to obtain any materials, documents or information through any means not purposely made available through the Site. Apple reserves the right to bar any such activity.\n\n"
                  "You may not attempt to gain unauthorized access to any portion or feature of the Site, or any other systems or networks connected to the Site or to any Apple server, or to any of the services offered on or through the Site, by hacking, password \"mining\" or any other illegitimate means.\n\n"
                  "You may not probe, scan or test the vulnerability of the Site or any network connected to the Site, nor breach the security or authentication measures on the Site or any network connected to the Site. You may not reverse look-up, trace or seek to trace any information on any other user of or visitor to the Site, or any other customer of Apple, including any Apple account not owned by you, to its source, or exploit the Site or any service or information made available or offered by or through the Site, in any way where the purpose is to reveal any information, including but not limited to personal identification or information, other than your own information, as provided for by the Site.\n\n"
                  "You agree that you will not take any action that imposes an unreasonable or disproportionately large load on the infrastructure of the Site or Apple’s systems or networks, or any systems or networks connected to the Site or to Apple.\n\n"
                  "You agree not to use any device, software or routine to interfere or attempt to interfere with the proper working of the Site or any transaction being conducted on the Site, or with any other person’s use of the Site.\n\n"
                  "You may not forge headers or otherwise manipulate identifiers in order to disguise the origin of any message or transmittal you send to Apple on or through the Site or any service offered on or through the Site. You may not pretend that you are, or that you represent, someone else, or impersonate any other individual or entity.\n\n"
                  "You may not use the Site or any Content for any purpose that is unlawful or prohibited by these Terms of Use, or to solicit the performance of any illegal activity or other activity which infringes the rights of Apple or others.\n\n"
                  "Purchases; Other Terms and Conditions\n"
                  "Additional terms and conditions may apply to purchases of goods or services and to specific portions or features of the Site, including contests, promotions or other similar features, all of which terms are made a part of these Terms of Use by this reference. You agree to abide by such other terms and conditions, including where applicable representing that you are of sufficient legal age to use or participate in such service or feature. If there is a conflict between these Terms of Use and the terms posted for or applicable to a specific portion of the Site or for any service offered on or through the Site, the latter terms shall control with respect to your use of that portion of the Site or the specific service.\n\n"
                  "Apple’s obligations, if any, with regard to its products and services are governed solely by the agreements pursuant to which they are provided, and nothing on this Site should be construed to alter such agreements.\n\n"
                  "Apple may make changes to any products or services offered on the Site, or to the applicable prices for any such products or services, at any time, without notice. The materials on the Site with respect to products and services may be out of date, and Apple makes no commitment to update the materials on the Site with respect to such products and services.\n\n"
                  "The following terms also govern and apply to your use of the Site, and they are incorporated herein by this reference:"
          ),
        ),
      ),
    );
  }
}
